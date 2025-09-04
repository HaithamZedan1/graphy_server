FROM node:18.20.6-slim

# Set working directory
WORKDIR /usr/src/app

# Install security updates & any needed build tools
RUN apt-get update && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
       ca-certificates curl git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade npm to the version you want
RUN npm install -g npm@9.1.3

# Copy only package files first (better Docker caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the app
COPY . .

# Expose app port
EXPOSE 8080

# Start the app
CMD ["node", "index.js"]
