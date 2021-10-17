# define builder phase for everything underneath
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build <-- contains everything needed in the container

# start second phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html