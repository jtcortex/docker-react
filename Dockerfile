# define builder phase for everything underneath
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build <-- contains everything needed in the container
# test commend

# start second phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html