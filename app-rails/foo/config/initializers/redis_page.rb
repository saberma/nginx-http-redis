require "redis"

RedisPage.configure do |config|
  # 通过访问 http://cache:ewHN84JZLyRurX@example.com:8081/products/1 来刷新缓存
  config.sweeper = { port: 8081, username: 'cache', password: 'ewHN84JZLyRurX' }
  config.redis = Redis.new(host: "redis", port: 6379, db: 11)
  config.ttl = 604800 # 1 week
end
