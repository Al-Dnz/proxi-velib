# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    gon.thp_location = Location.first
    # SayHelloJob.perform_later
    # SayHelloJob.set(wait: 10.seconds).perform_later
  end

  def create
    cookies[:place_to_find] = params[:place]
    results = Geocoder.search(cookies[:place_to_find])

    @placefound = Hashie::Mash.new("latitude" => results.first.coordinates[0].to_s, "longitude" => results.first.coordinates[1].to_s)
    @placefound_name = params[:place].to_s.upcase

    respond_to do |format|
      format.js
    end
  end
end
