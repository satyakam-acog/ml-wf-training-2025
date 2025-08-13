FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy the rest of the project
COPY . .

# Build the static site
RUN npm run build

# Start Quartz on default port (e.g., 8080) bound to localhost
CMD ["npm", "run", "serve", "--", "--host", "127.0.0.1", "--port", "8080"]
