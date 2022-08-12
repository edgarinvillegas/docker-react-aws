FROM node:14-alpine as build_stage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

EXPOSE 80
FROM nginx
COPY --from=build_stage /app/build /usr/share/nginx/html