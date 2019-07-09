# frozen_string_literal: true

module EasyPost
  class Object
    include ActiveModel::Model

    require "easy_post/object/creatable"
    require "easy_post/object/retrievable"

    # TODO: de-uglify
    # :reek:TooManyStatements
    # :reek:NestedIterators
    def self.attr_reader(*names)
      options = names.pop if names.last.is_a?(Hash)
      attrs   = names.reject { |name| name.is_a?(Hash) }
      attributes.concat(attrs)

      super(*attrs).tap do |_|
        options = Hash(options)
        return unless options.key?(:coerce)

        attrs.each do |attr|
          define_method attr do
            klass = options[:coerce]
            if klass.is_a?(TrueClass)
              klass = "EasyPost::#{attr.to_s.camelize}".constantize
            end

            case value = attributes[attr]
            when Hash  then klass.new(value)
            when Array then value.map { |value| klass.new(value) }
            else value
            end
          end
        end
      end
    end

    def self.attributes
      @attributes ||= []
    end

    def attributes
      Hash[
        self.class.attributes.map do |name|
          [name, instance_variable_get(:"@#{name}")]
        end
      ]
    end

    def initialize(attributes = {})
      self.class.attributes.each do |name|
        value = attributes.with_indifferent_access[name]
        instance_variable_set(:"@#{name}", value)
      end
    end

    delegate :resource_name,
      to: :class

    def self.resource_name
      model_name.element
    end
  end
end
