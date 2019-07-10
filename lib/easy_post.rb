# frozen_string_literal: true

require "openssl"
require "uri"
require "net/http"
require "faraday"
require "faraday_middleware"

require "active_model"
require "active_support/core_ext"
require "active_support/inflector"

require "easy_post/connection"
require "easy_post/object"

require "easy_post/address"
require "easy_post/field_error"
require "easy_post/verification_details"
require "easy_post/verification"
require "easy_post/verifications"

require "easy_post/parcel"

require "easy_post/version"

module EasyPost
  class Error < StandardError; end

  API_SUBDOMAIN = ENV.fetch("EASY_POST_API_SUBDOMAIN", "api").freeze
  API_DOMAIN    = ENV.fetch("EASY_POST_API_DOMAIN", "easypost.com").freeze
  API_VERSION   = ENV.fetch("EASY_POST_API_VERSION", "v2").freeze
  API_KEY       = ENV["EASY_POST_API_KEY"]

  LOGGER        = Logger.new($stderr)
end
