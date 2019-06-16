# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Location.create(name: Faker::Address.city, address: Faker::Address.street_address, latitude: Faker::Address.latitude.to_i, longitude: Faker::Address.longitude.to_i )

require 'httparty'

response = HTTParty.get('http://api.citybik.es/v2/networks/velib')
# , :query => query ,headers: { 'Content-Type' => 'application/json' }
json = JSON.parse(response.body)
velibs = json["network"]
stations = velibs["stations"]
# @stations.each { |e| puts "#{e['name']},#{e['latitude']}; #{e['longitude'].class}, #{e['free_bikes'].class}, #{e['id'].class}" }
number_updated_stations = 0

stations.each do |e|
  station = Station.find_by(identification: e['id'])
  next unless station.vacant_bikes != e['free_bikes']

  station.update( vacant_bikes: e['free_bikes'] )
  number_updated_stations += 1
  puts "station updated -->  id: #{station.identification} // #{e['id']} "
end
puts "NOMBRE DE STATIONS MISES À JOUR : #{number_updated_stations}"
