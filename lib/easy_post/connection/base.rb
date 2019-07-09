# frozen_string_literal: true

module EasyPost
  class Connection::Base
    private_class_method :new

    attr_reader :resource_name,
      :options

    def initialize(resource_name, options = {})
      @resource_name = resource_name
      @options       = options
    end

    private

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
        builder.response :logger, EasyPost::LOGGER
        builder.response :json,
          content_type:   "application/json",
          parser_options: { symbolize_names: true }
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

    def resource_class
      "EasyPost::#{resource_name.camelize}".constantize
    end
  end
end
