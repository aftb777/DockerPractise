# STEP 1: Base image for React/Vite app
FROM node:20-alpine

# STEP 2: Create non-root user and group
RUN addgroup -S app && adduser -S -G app app

# STEP 3: Set working directory
WORKDIR /app

# STEP 4: Copy dependency files first (cache-friendly)
COPY package*.json ./

# STEP 5: Install dependencies
RUN npm install

# STEP 6: Copy the rest of the app
COPY . .

# STEP 7: Expose Vite dev port
EXPOSE 5173

# STEP 8: Run Vite dev server on 0.0.0.0 so Docker host can access it
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
