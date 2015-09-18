require "redis"

$redis = Redis.new(host: "redis", port: 6379, db: 10)
