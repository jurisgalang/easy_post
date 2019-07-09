# frozen_string_literal: true

module EasyPost
  class Connection::Post < Connection::Base
    def self.call(resource_name, payload)
      new(resource_name, payload).post
    end

    def post
      connection.post(path, payload)
    end
  end
end
