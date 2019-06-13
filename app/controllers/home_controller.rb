# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    gon.thp_location = Location.first
  end
end
