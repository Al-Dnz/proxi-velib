# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { Faker::Address.city }
    address { Faker::Address.street_address }
    latitude { Faker::Address.latitude.to_i }
    longitude { Faker::Address.longitude.to_i }
  end
end
