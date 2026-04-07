# --------------> The build image
FROM node:25 AS build
WORKDIR /usr/src/app
COPY package*.json /usr/src/app/
RUN npm ci --omit=dev
# --------------> The production image
FROM node:25-alpine
ENV NODE_ENV=production
USER node
WORKDIR /usr/src/app
COPY --chown=node:node --from=build /usr/src/app/node_modules /usr/src/app/node_modules
COPY --chown=node:node . /usr/src/app
EXPOSE 3000
CMD ["node", "./bin/www"]