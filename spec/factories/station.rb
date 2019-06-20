# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    name { Faker::Address.city }
    identification { Faker::IDNumber.valid_south_african_id_number }
    latitude { Faker::Address.latitude.to_i }
    longitude { Faker::Address.longitude.to_i }
    vacant_bikes { rand(0..25) }
  end
end
