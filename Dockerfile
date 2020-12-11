FROM node:10.23.0-alpine3.11

# 参考 https://pm2.io/docs/runtime/integration/docker/

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
        && cnpm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
