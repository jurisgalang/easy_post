# frozen_string_literal: true

module EasyPost
  class Connection::Get < Connection::Base
    def self.call(resource_name, id)
      new(resource_name, id: id).call
    end

    def call
      connection.get(path)
    end

    def path
      "#{super}/#{options[:id]}"
    end
  end
end
