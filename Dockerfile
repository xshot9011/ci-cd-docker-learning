# build stage
FROM node:alpine as build_stage

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# run stage
FROM nginx
COPY --from=build_stage /app/build /usr/share/nginx/html
# copy something from another phase

# ngnix has it own command to run this file so nothing to do more