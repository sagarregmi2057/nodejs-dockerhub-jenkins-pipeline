

# here we are using the official base image of node
FROM node:latest



# setting working directory in the container as /app

WORKDIR /app


# copy the package.json and package-lock.json files to the working directory

COPY package*.json ./

# install the dependencies

RUN npm install

# copy the rest of the application code to the working directory

COPY . .

EXPOSE 3000

# run the application

CMD ["npm", "start"]