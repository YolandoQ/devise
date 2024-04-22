FROM node:20.12.0

WORKDIR /frontend
COPY package.json .

COPY package.json ./frontend/package.json
COPY package-lock.json ./frontend/package-lock.json
RUN npm install 
COPY . ./
ENV NODE_ENV development
EXPOSE 3000

# start app
CMD ["npm", "run", "dev"] 