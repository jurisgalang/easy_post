# frozen_string_literal: true

module EasyPost
  class Address < EasyPost::Object
    include Creatable
    include Retrievable

    attr_reader :id,
      :object,
      :mode,
      :reference,
      :created_at,
      :updated_at

    attr_reader :street1,
      :street2,
      :city,
      :state,
      :zip,
      :country,
      :residential,
      :carrier_facility,
      :name,
      :company,
      :phone,
      :email,
      :federal_tax_id,
      :state_tax_id

    attr_reader :verifications,
      coerce: true
  end
end
