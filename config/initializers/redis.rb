# frozen_string_literal: true

uri = URI.parse((ENV['REDISTOGO_URL']).to_s || "redis://localhost:6379/")
REDIS = Redis.new(url: uri, port: uri.port, password: uri.password)
