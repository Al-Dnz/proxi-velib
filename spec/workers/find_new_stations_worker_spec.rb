# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindNewStationsWorker, type: :worker do
  include HTTParty
  let(:response) { HTTParty.get('http://api.citybik.es/v2/networks/velib') }

  describe 'Response status' do
    it "is valid when you connect to API URL" do
      expect(response.code).to eq(200)
    end
  end

  context 'when JSON datas are loaded' do
    describe 'general dataset' do
      it "gives you a array as response" do
        expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      end

      it "is not empty" do
        expect(JSON.parse(response.body)["network"]).not_to be_empty
      end
    end

    describe 'Id' do
      it "exists in data set" do
        expect(JSON.parse(response.body)["network"]["stations"][0]).to include("id")
      end
      it "is not  an empty data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["id"]).not_to be_nil
      end
      it "is a valid data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["id"]).to be_an_instance_of(String)
      end
    end

    describe 'Longitude' do
      it "exists in data set" do
        expect(JSON.parse(response.body)["network"]["stations"][0]).to include("longitude")
      end
      it "is not  an empty data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["longitude"]).not_to be_nil
      end
      it "is a valid data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["longitude"]).to be_an_instance_of(Float)
      end
    end

    describe 'Latitude' do
      it "exists in data set" do
        expect(JSON.parse(response.body)["network"]["stations"][0]).to include("latitude")
      end
      it "is not  an empty data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["latitude"]).not_to be_nil
      end
      it "is a valid data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["latitude"]).to be_an_instance_of(Float)
      end
    end

    describe 'Empty slots' do
      it "exists in data set" do
        expect(JSON.parse(response.body)["network"]["stations"][0]).to include("empty_slots")
      end
      it "is not  an empty data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["empty_slots"]).not_to be_nil
      end
      it "is a valid data" do
        expect(JSON.parse(response.body)["network"]["stations"][0]["empty_slots"]).to be_an_instance_of(Integer)
      end
    end
  end
end
