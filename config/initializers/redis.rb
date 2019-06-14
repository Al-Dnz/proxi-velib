# frozen_string_literal: true

uri = ENV["REDISTOGO_URL"] || "redis://localhost:6379/"
REDIS = Redis.new(url: uri)
