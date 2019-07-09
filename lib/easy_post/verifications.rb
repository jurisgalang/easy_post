# frozen_string_literal: true

module EasyPost
  class Verifications < EasyPost::Object
    attr_reader :zip4,
      :delivery,
      coerce: Verification
  end
end
