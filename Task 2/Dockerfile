# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies
RUN npm install

# Build the Vue.js application for production
RUN npm run build

CMD ["nginx", "-g", "daemon off;"]
