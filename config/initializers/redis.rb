# frozen_string_literal: true

uri = URI.parse("redis://#{ENV['REDISTOGO_URL']}" || "redis://localhost:6379/")
REDIS = Redis.new(url: uri, port: uri.port, password: uri.password)
