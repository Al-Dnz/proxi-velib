# frozen_string_literal: true

class SayHelloWorker
  include Sidekiq::Worker
  require 'faker'

  def perform
    puts "+---------------------------------------------------------------------------------+"
    puts "|********# HELLO FROM BACKGROUND-JOB FEATURE at --> #{Time.zone.now} #*********|"
    puts "+---------------------------------------------------------------------------------+"
    # Location.create(name: Faker::Address.city, address: Faker::Address.street_address, latitude: (Faker::Address.latitude).to_f, longitude:( Faker::Address.longitude).to_f  )
  end
end
