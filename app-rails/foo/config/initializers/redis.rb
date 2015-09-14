require "redis"

$redis_cache = Redis.new(host: "redis", port: 6379, db: 15)
