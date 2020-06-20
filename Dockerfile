# Build Phase
# First Container
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


# Run Phase
# Second Container
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# 0 For First Container