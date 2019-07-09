# frozen_string_literal: true

module EasyPost
  module Object::Retrievable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def fetch(id)
        response = Connection::Get.call(resource_name, id)
        # TODO: error handler
        return unless response.success?

        new(response.body)
      end
    end
  end
end
