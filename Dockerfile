FROM node:18-alpine As development

RUN npm i -g pnpm

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

RUN pnpm install

COPY --chown=node:node . .

# Use the node user from the image (instead of the root user)
USER node
