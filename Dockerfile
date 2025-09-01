# ******* Docker and Angular + NGINX (Nginx ชื่อเต็มๆว่า Engine-X คือ Web Server) Running Angular App with Nginx

### STAGE 1:BUILD ###
# This is needed to build and compile our code while generating the docker image
FROM node:18.14.1 as angular
LABEL authors="ttknp"

# Create a Virtual directory inside the docker image # you can use . if you don't want nested dir
WORKDIR /home/app

# Copy package*.json files from local machine to virtual directory in docker image
COPY package*.json /home/app

# Install package
# npm ci == npm clean install
RUN npm ci

# after install copy all to /home/app
COPY . /home/app

# and build static files
RUN npm run build


### STAGE 2:RUN ###
# Defining nginx image to be used # Using alpine tags is not required but is a popular choice because of the reduced image size.
FROM nginx:alpine

# Create a Virtual directory inside the docker image
WORKDIR /usr/share/nginx/html

# Copying compiled code and nginx config to different folder # NOTE: This path may change according to your project's output folder (see on angular.json file)
# focus on /home/app/... it should follow WORKDIR angular
COPY --from=angular /home/app/dist/build-basic-webapp-using-angular/browser /usr/share/nginx/html
# Copy your custom nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Importance
CMD ["nginx", "-g", "daemon off;"]


# Step run build & run image on container
# . it means Dockerfile location
# 1. docker build -t <image name> .
# ex, docker build -t angular-app .
# 2. docker run -d -p <port access runtime>:<port on nginx.conf> <image name>
# ex , docker run -d -p 8080:8000 angular-app
