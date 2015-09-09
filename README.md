##

此程序用于测试 nginx 返回以下资源时的速度：

1. 静态文件
2. Redis 内容
3. node app 处理结果

### 使用不同的后端或者静态文件

```
http://192.168.99.100:8080/a             # app 响应
http://192.168.99.100:8080/r             # redis 响应
http://192.168.99.100:8080/index.html    # 静态文件响应
```

### 手动设置 redis 的值

```
docker exec -it djinginxhttpredis_redis_1 bash
redis-cli
select 10
set "/r" "r"
```

### 测试结果

index | 825.35 [#/sec]
redis | 893.37 [#/sec]
app   | 431.31 [#/sec]
