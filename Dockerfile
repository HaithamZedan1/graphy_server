FROM node:18.20.6

# Upgrade Debian system packages to get latest security fixes
RUN apt-get update && apt-get dist-upgrade -y && rm -rf /var/lib/apt/lists/*

# Copy app files
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

# Install Node dependencies
RUN npm install

EXPOSE 4000
CMD ["node", "graphserver.js"]
