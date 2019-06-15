# frozen_string_literal: true

class UpdateDbWorker
  include Sidekiq::Worker
  require 'httparty'

  def perform
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', headers: { 'Content-Type' => 'application/json' })
    json = JSON.parse(response.body)
    velibs = json["network"]
    stations = velibs["stations"]
    # stations.each { |e| Station.find(identification: e['id']).update( vacant_bikes: e['free_bikes'] ) }

    number_updated_stations = 0

    stations.each do |e|
      station = Station.find_by(identification: e['id'])
      next unless station.vacant_bikes != e['free_bikes']

      station.update( vacant_bikes: e['free_bikes'] )
      number_updated_stations += 1
      puts "station updated -->  id: #{station.identification} "
    end
    puts "NOMBRE DE STATIONS MISES À JOUR : #{number_updated_stations}"
  end
end
