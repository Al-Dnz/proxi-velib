# frozen_string_literal: true

require 'faker'

# Location.create(name: Faker::Address.city, address: Faker::Address.street_address, latitude: Faker::Address.latitude.to_i, longitude: Faker::Address.longitude.to_i )

require 'httparty'

response = HTTParty.get('http://api.citybik.es/v2/networks/velib')
json = JSON.parse(response.body)
velibs = json["network"]
stations = velibs["stations"]

puts stations.inspect
# stations.each { |e| puts "#{e['name']},#{e['latitude']}; #{e['longitude'].class}, #{e['free_bikes'].class}, #{e['id'].class}" }

# number_updated_stations = 0
# stations.each do |e|
#   station = Station.find_by(identification: e['id'])
#   next unless station.vacant_bikes != e['free_bikes']
#
#   station.update( vacant_bikes: e['free_bikes'] )
#   number_updated_stations += 1
#   puts "station updated -->  id: #{station.identification} // #{e['id']} "
# end
# puts "NOMBRE DE STATIONS MISES À JOUR : #{number_updated_stations}"
