FROM node:22

WORKDIR /app

# Copy dependency files first (for caching)
COPY package*.json ./
RUN npm install

# Copy the rest of the project
COPY . .

# Build the static site from inside the quartz folder
RUN npx quartz build 

# Serve the site (bind to localhost for reverse proxy)
CMD ["npx", "quartz", "serve", "--hostname", "127.0.0.1", "--port", "8080", "--dir", "quartz"]
