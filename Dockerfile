FROM node:18-alpine3.16 as build-step

WORKDIR /app

COPY ["package*.json", "nx.json", "./"]
COPY ["decorate-angular-cli.js", "./"]

# RUN npm install --g yarn
RUN npm install -g @angular/cli
RUN npm install -g @nrwl/cli
RUN npm install -g nodemon

# run yarn install in our local machine
RUN yarn install

COPY . .

RUN yarn run ssr-prod

EXPOSE 4000

CMD ["nodemon", "dist/apps/demo-site/server/main.js"]
