# frozen_string_literal: true

module EasyPost
  class Parcel < EasyPost::Object
    include Creatable
    include Retrievable

    attr_reader :id,
      :object,
      :mode,
      :reference,
      :created_at,
      :updated_at

    attr_reader :length,
      :width,
      :height,
      :predefined_package,
      :weight
  end
end
