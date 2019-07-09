# frozen_string_literal: true

module EasyPost
  class VerificationDetails < EasyPost::Object
    attr_reader :latitude,
      :longitude,
      :time_zone
  end
end
