# frozen_string_literal: true

class FindNewStationsWorker
  include Sidekiq::Worker
  require 'httparty'

  def perform
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', headers: { 'Content-Type' => 'application/json' })
    json = JSON.parse(response.body)
    velibs = json["network"]
    stations = velibs["stations"]

    number_new_stations = 0
    puts "*********************************************".cyan
    puts "RESEARCH FOR NEW STATIONS ... ".cyan
    puts "BEGINS AT : #{Time.zone.now}".cyan
    stations.each do |e|
      if !Station.exists?(identification: e['id'])
        Station.create(identification: e['id'], name: e["name"], latitude: e["latitude"], longitude: e["longitude"], vacant_bikes: e["free_bikes"])
      end
    end
    puts "NOMBRE DE NOUVELLE STATIONS AJOUTÉES : #{number_new_stations}".cyan
    puts "FINISHED AT :#{Time.zone.now}".cyan
  end
end
