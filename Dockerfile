# Build stage
FROM node:20-alpine AS build
RUN apk add --no-cache git
RUN git clone https://github.com/LondheShubham153/online_shopping_app.git
WORKDIR /online_shopping_app
RUN npm install && npm run build

# Production stage
FROM nginx:latest
COPY --from=build /online_shopping_app/dist/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
