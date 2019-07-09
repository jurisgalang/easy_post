# frozen_string_literal: true

module EasyPost
  class Connection::Post < Connection::Base
    def self.call(resource_name, payload)
      new(resource_name, payload: payload).call
    end

    def call
      connection.post(path, options[:payload])
    end
  end
end
