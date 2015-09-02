var koa = require('koa');
var app = koa();

var Redis = require('ioredis');
var redis = new Redis(6379, process.env.REDIS_PORT_6379_TCP_ADDR);

app.use(function *(){
  redis.set('/', 'Hello World');
  this.body = 'Hello World';
});

app.listen(3000);
