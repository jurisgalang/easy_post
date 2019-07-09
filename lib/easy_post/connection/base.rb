# frozen_string_literal: true

module EasyPost
  class Connection::Base
    attr_reader :resource_name,
      :payload

    def initialize(resource_name, payload = nil)
      @resource_name = resource_name
      @payload       = payload
    end

    SSL_OPTIONS = {
      verify:  OpenSSL::SSL::VERIFY_PEER,
      version: :TLSv1_2
    }.freeze

    # :reek:FeatureEnvy
    def connection
      @connection ||= Faraday.new(url, ssl: SSL_OPTIONS) do |builder|
        builder.request  :json
        builder.request  :retry
        builder.request  :basic_auth, EasyPost::API_KEY, nil
        builder.response :logger, Logger.new($stderr)
        builder.response :json, content_type: "application/json"
        builder.adapter  Faraday.default_adapter
      end
    end

    # :reek:UtilityFunction
    def url
      host = "#{EasyPost::API_SUBDOMAIN}.#{EasyPost::API_DOMAIN}"
      URI::HTTPS.build(host: host).to_s
    end

    def path
      "/#{EasyPost::API_VERSION}/#{resource_name.pluralize}"
    end
  end
end
