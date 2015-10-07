## nginx 使用 redis 缓存

* 商品详情页 http://192.168.99.100/products/1
* 商品列表页 http://192.168.99.100/products

第一次访问之后会使用 redis 缓存，可以在商品详情页更新商品刷新商品详情页和列表页的缓存。

### 安装

#### Mac 环境下

##### 安装 Docker 环境

```
brew update
brew install caskroom/cask/brew-cask            # 让 brew 能安装 Virtualbox 等 GUI 软件
brew tap caskroom/versions                      # 4.3 版本的 virtualbox 配合 docker 更稳定一些，而不是 5.0 最新版
brew cask install virtualbox43691406

brew install docker-compose
brew install docker-machine                     # 使用 docker-machine 来管理 docker 容器
docker-machine create --driver virtualbox dev   # 创建虚拟机 dev
# 创建虚拟机 dev
docker-machine create --driver virtualbox --virtualbox-boot2docker-url https://get.daocloud.io/boot2docker/boot2docker-lastest.iso dev

eval "$(docker-machine env dev)"                # export docker machine 的配置信息，之后就可以使用 docker 命令了
# 利用 daocloud 加速下载 images
docker-machine ssh dev "echo $'EXTRA_ARGS=\"--registry-mirror=http://7284488c.m.daocloud.io\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"
```

##### 启动服务

```
docker-compose build
docker-compose up                               # 启动服务
```
