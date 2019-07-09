# frozen_string_literal: true

module EasyPost
  class Object
    include ActiveModel::Model

    def self.attr_reader(*names)
      attributes.concat(names)
      super(*names)
    end

    def self.attributes
      @attributes ||= []
    end

    def self.create(attributes = {})
      new(attributes).save
    end

    def save
      payload = attributes.except(
        :id, :object, :mode, :created_at, :updated_at
      )
      response = Connection::Post.call(resource_name, payload)
      return unless response.success?

      self.class.new(response.body)
    end

    def attributes
      Hash[self.class.attributes.map { |name| [name, send(name)] }]
    end

    def initialize(attrs = {})
      attrs.deep_symbolize_keys.each do |name, value|
        next unless self.class.attributes.include?(name)

        instance_variable_set(:"@#{name}", value)
      end
    end

    private

    def resource_name
      model_name.element
    end
  end
end
