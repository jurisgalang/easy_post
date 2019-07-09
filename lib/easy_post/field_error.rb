# frozen_string_literal: true

module EasyPost
  class FieldError < EasyPost::Object
    attr_reader :field,
      :message
  end
end
