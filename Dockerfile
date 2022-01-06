FROM node:16.13.1-alpine3.15

# 参考 https://pm2.io/docs/runtime/integration/docker/
RUN set -x \ 
        && export ALPINE_VERSION=$(sed 's/\.\d\+$//' /etc/alpine-release) \
        && echo "https://mirrors.aliyun.com/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories \
        && echo "https://mirrors.aliyun.com/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories \
        && apk add tzdata \
        && cp /usr/share/zoneinfo/PRC /etc/localtime \
        && npm set registry https://registry.npm.taobao.org \
        && npm set disturl https://npm.taobao.org/dist \
        && npm set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents \
        && npm set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass \
        && npm install -g pm2

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554 3000

VOLUME /data

VOLUME /conf

WORKDIR /data

# Start pm2.json process file
#CMD ["pm2-runtime", "start", "./node_modules/nuxt/bin/nuxt.js"]
