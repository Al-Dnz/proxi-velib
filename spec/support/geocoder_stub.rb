# frozen_string_literal: true

module GeocoderStub
  def self.stub_with(place_to_find)
    Geocoder.configure(lookup: :test)

    results = [
      {
        'latitude' => Faker::Address.latitude.first(15),
        'longitude' => Faker::Address.longitude.first(15)
      }
    ]

    queries = [place_to_find.full_address, place_to_find.zip]
    queries.each { |q| Geocoder::Lookup::Test.add_stub(q, results) }
  end
end
