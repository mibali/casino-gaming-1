FROM node:14.20 as node

WORKDIR /app

COPY ./package.json .

# RUN npm install -g @angular/cli

# RUN npm install --legacy-peer-deps

RUN npm install 

COPY . .

# RUN ng build 
RUN npm run build
EXPOSE 4200

FROM nginx:alpine
COPY --from=node /app/dist/casino-gaming /usr/share/nginx/html

