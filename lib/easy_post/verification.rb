# frozen_string_literal: true

module EasyPost
  class Verification < EasyPost::Object
    attr_reader :success

    attr_reader :errors,
      coerce: FieldError

    attr_reader :details,
      coerce: VerificationDetails
  end
end
