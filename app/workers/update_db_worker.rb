# frozen_string_literal: true

class UpdateDbWorker
  include Sidekiq::Worker
  require 'httparty'

  def perform
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', headers: { 'Content-Type' => 'application/json' })
    json = JSON.parse(response.body)
    velibs = json["network"]
    stations = velibs["stations"]

    number_updated_stations = 0
    puts "-------------------------------------------------"
    puts "UPDATING DATA ... ".blue.blink
    puts "BEGINS AT : #{Time.zone.now}".blue.blink
    stations.each do |e|
      station = Station.find_by(identification: e['id'])
      if !Station.exists?(identification: e['id'])
        Station.create(identification: e['id'], name: e["name"], latitude: e["latitude"], longitude: e["longitude"], vacant_bikes: e["free_bikes"])
      end

      next unless station.vacant_bikes != e['free_bikes']

      # updating_date = station.updated_at
      station.update( vacant_bikes: e['free_bikes'] )
      # if updating_date != station.updated_at
      number_updated_stations += 1
      puts "station updated -->  id: #{station.identification} "
      # end
    end
    puts "NOMBRE DE STATIONS MISES À JOUR : #{number_updated_stations} / #{Station.all.count}".blue.blink
    puts "FINISHED AT :#{Time.zone.now}".blue.blink
  end
end
