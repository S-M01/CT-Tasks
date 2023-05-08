# Use an official Node.js runtime as a parent image
FROM node:14 as NPM_BUILD_IMAGE

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies
RUN npm install

# Build the Vue.js application for production
RUN npm run build


# Nginx config
FROM nginx:alpine

# Copy deployable package above to nginx image
COPY --from=NPM_BUILD_IMAGE /app/dist /usr/share/nginx/html

# Remove default nginx website
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx configuration file to container
COPY nginx.conf /etc/nginx/conf.d

# Port on which server is running
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]