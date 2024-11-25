# Base image with Node.js and Java (use openjdk for Java)
FROM node:18-alpine

# Install Java (OpenJDK)
RUN apk add --no-cache openjdk17

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the entire project into the container
COPY . .

# Ensure the grib2json script is executable
RUN chmod +x converter/bin/grib2json

# Expose the port the app runs on (if applicable)
EXPOSE 7000

# Command to run the application
CMD ["npm", "run", "start:dev"]
