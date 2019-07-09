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
require "easy_post/version"

module EasyPost
  class Error < StandardError; end

  API_SUBDOMAIN = ENV.fetch("EASY_POST_API_SUBDOMAIN", "api").freeze
  API_DOMAIN    = ENV.fetch("EASY_POST_API_DOMAIN", "easypost.com").freeze
  API_VERSION   = ENV.fetch("EASY_POST_API_VERSION", "v2").freeze
  API_KEY       = ENV.fetch("EASY_POST_API_KEY", "EZTK1bf0f74ffe814c0ea2aef621d8b46759aftdjk67huaFsaMUMauVDw").freeze
end
