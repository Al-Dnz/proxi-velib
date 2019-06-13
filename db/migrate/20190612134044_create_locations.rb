# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.decimal :latitude, precision: 15, scale: 13
      t.decimal :longitude, precision: 15, scale: 13

      t.timestamps
    end

    Location.create(name: "Locaux THP", address: "9 rue Bergère , 75009 Paris", latitude: 48.8721312, longitude: 2.3466598)
  end
end
