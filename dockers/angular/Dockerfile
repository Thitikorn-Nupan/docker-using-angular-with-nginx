# Docker and Angular + NGINX (Nginx ชื่อเต็มๆว่า Engine-X คือ Web Server)
### STAGE 1:BUILD ###
# This is needed to build and compile our code
# while generating the docker image
FROM node:18.14.1 as angular
LABEL authors="ttknpde-v"

# Create a Virtual directory inside the docker image
WORKDIR /home/app
# you can use . for access /home/app

# COPY package*.json /home/app/
# RUN npm ci
# can reduce
# ../.. means you are position build-basic-webapp-using-angular
# . means (/home/app)
# Copy files from local machine to virtual directory in docker image

COPY ../.. /home/app

#  npm clean install: npm ci
RUN npm ci && npm run build


### STAGE 2:RUN ###
# Defining nginx image to be used
# Using alpine tags is not required but is a popular choice because of the reduced image size.
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copying compiled code and nginx config to different folder
# NOTE: This path may change according to your project's output folder
# build-basic-webapp-using-angular importance
# can use . for access WORKDIR
COPY --from=angular /home/app/dist/build-basic-webapp-using-angular/browser /usr/share/nginx/html

# Exposing a port, here it means that inside the container
# the app will be using Port 80 while running
EXPOSE 80
