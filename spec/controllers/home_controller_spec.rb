# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include_context 'gon'

  describe 'GET #index' do
    it 'gonifies sations as expected' do
      get :index
      expect(gon['stations']).to eq Station.all
    end

    it 'gonifies thp_station as expected' do
      get :index
      expect(gon['thp_station']).to eq Location.first
    end
  end

  describe ' #create' do
    it 'find a real place' do
      Geocoder.configure(lookup: :test)
      Geocoder::Lookup::Test.add_stub(
        "Los Angeles, CA", [{
          "latitude" => 34.052363,
          "longitude" => -118.256551,
          "address" => 'Los Angeles, CA, USA',
          "state" => 'California',
          "state_code" => 'CA',
          "country" => 'United States',
          "country_code" => 'US'
        }],
      )
    end
  end
end
