FROM node:20.12.0-alpine

WORKDIR /frontend

COPY package.json .
COPY package-lock.json .

RUN npm install 
COPY . ./
ENV NODE_ENV development
EXPOSE 3000

# start app
CMD ["npm", "run", "start"] 