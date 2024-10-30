Installation
=============================
use redis stack docker image to access all redis module 
 - redis json 


```
docker pull redis/redis-stack:latest

docker run -d --name redis-stack -p 6379:6379 redis/redis-stack:latest
```

verify Installation

```
docker exec -it redis-stack redis-cli
127.0.0.1:6379> MODULE LIST

```