FROM node:16.13.1-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
# the default command of the nginx image is going to start up nginx for us
# CMD ["nginx", "-g", "daemon off"]


