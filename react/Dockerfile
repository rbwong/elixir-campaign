FROM node:14.11.0-slim
WORKDIR /app/frontend
COPY package.json /app/frontend

RUN yarn install

EXPOSE 3000
CMD yarn start