# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[5.2]
  require 'httparty'
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :vacant_bikes
      t.decimal :latitude, precision: 15, scale: 13
      t.decimal :longitude, precision: 15, scale: 13
      t.string :identification

      t.timestamps
    end

    Station.all.each { |station| Station.delete(station) }
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', headers: { 'Content-Type' => 'application/json' })
    json = JSON.parse(response.body)
    @velibs = json["network"]
    @stations = @velibs["stations"]
    @stations.each { |e| Station.create(name: e['name'], latitude: e['latitude'], longitude: e['longitude'], vacant_bikes: e['free_bikes'], identification: e['id'] ) }
  end
end
