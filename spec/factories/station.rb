# frozen_string_literal: true

require './spec/support/geocoder_stub'

FactoryBot.define do
  factory :station do
    name { Faker::Address.city }
    identification { Faker::IDNumber.valid_south_african_id_number }
    latitude { Faker::Address.latitude.to_f }
    longitude { Faker::Address.longitude.to_f }
    vacant_bikes { rand(0..25) }
  end
end
