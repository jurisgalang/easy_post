# frozen_string_literal: true

module EasyPost
  # EasyPost::Address.create(
  #   street1: "417 MONTGOMERY ST",
  #   street2: "FLOOR 5",
  #   city: "SAN FRANCISCO",
  #   state: "CA",
  #   zip: "94104",
  #   country: "US",
  #   company: "EasyPost",
  #   phone: "+1 (415) 123-4567"
  # )
  class Address < EasyPost::Object
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
      :state_tax_id,
      :verifications
  end
end
