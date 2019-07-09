# frozen_string_literal: true

module EasyPost
  module Object::Creatable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def create(attributes = {})
        payload = attributes.deep_symbolize_keys.except(
          :id, :object, :mode, :created_at, :updated_at
        )
        response = Connection::Post.call(resource_name, payload)
        # TODO: error handler
        return unless response.success?

        new(response.body)
      end
    end
  end
end
