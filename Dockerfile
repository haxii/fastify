FROM node:20-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --omit=dev

RUN rm -rf /usr/src/app/node_modules/.bin /usr/src/app/node_modules/.package-lock.json

FROM node:20-alpine

COPY --from=build /usr/src/app/node_modules /usr/local/lib/node_modules
