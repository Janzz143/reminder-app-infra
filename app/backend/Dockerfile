# Use official Node.js LTS image as base
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy backend source code
COPY . .

# Expose port your app runs on
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]

