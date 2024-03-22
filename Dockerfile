FROM node:20-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --omit=dev

RUN rm package*.json

FROM node:20-alpine

COPY --from=build /usr/src/app /usr/src/app

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "node" ]