FROM iojs:3.0.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src

# http://stackoverflow.com/a/30926403
# npm install 的目录与 volumes 路径相同，node_modules 目录会被覆盖消除，所以只能安装到上级目录
COPY package.json /usr/src/
RUN npm install

WORKDIR /usr/src/app

CMD ["npm", "start"]
