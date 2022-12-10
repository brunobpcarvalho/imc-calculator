FROM node:16

# We have to install nodemon globally before moving into the working directory
RUN npm install -g nodemon

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Bundle app source
COPY . .

RUN npm install

EXPOSE 8080

CMD chmod +x ./start.sh