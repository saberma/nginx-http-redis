##

此程序用于测试 nginx 返回以下资源时的速度：

1. 静态文件
2. Redis 内容
3. node app 处理结果

### 使用不同的后端或者静态文件

```
http://192.168.99.100:8080/index.html    # 静态文件
http://192.168.99.100:8080/app-node      # app 响应
http://192.168.99.100:8080/redis         # redis 响应
http://192.168.99.100:8080/              # rails 响应
http://192.168.99.100:8081/              # rails 响应，触发缓存更新，用户名:cache    密码:ewHN84JZLyRurX

### 手动设置 redis 的值

```
docker exec -it djinginxhttpredis_redis_1 redis-cli
select 10
set "/" "foo"
set "/redis" "r"
monitor    # 实时查看访问情况
```

### 测试结果

```
index | 825.35 [#/sec]
redis | 893.37 [#/sec]    <= fastest
app   | 431.31 [#/sec]
rails | 131.15 [#/sec]    <= slowest
```

增加 redis 缓存这一层，对性能影响不大：

```
missing redis | 31.44 [#/sec] | /through-redis-to-app    # 经过 redis 缓存不命中到达 app
directly      | 33.33 [#/sec] | /to-app-directly         # 直接使用 app
```

## Rails

```
docker-compose run apprails rake db:migrate
docker-compose run apprails rake db:seed
```

## 参考资料

http://over9000.org/category/caching-with-redis
