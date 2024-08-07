# # Stage 0, "build-stage", based on Node.js, to build and compile the frontend
# FROM node:14.17-alpine as build-stage
# WORKDIR /app
# COPY package*.json /app/
# RUN npm install
# COPY ./ /app/
# ARG configuration=production
# RUN npm run build -- --output-path=./dist/out --configuration $configuration

# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:1.15-alpine
#Copy ci-dashboard-dist

COPY  / /usr/share/nginx/html
#Copy default nginx configuration
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf