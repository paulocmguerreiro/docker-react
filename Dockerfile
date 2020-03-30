# MULTI-STEP
# BUILD : docker build .
# RUN : docker run -it -p 8080:80 9ca5f9afdc82

# BUILDER PHASE
# compilar = nome atribuído a esta fase
# Contentor temporário
FROM node:alpine as compilar
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# RUN PHASE
FROM nginx
COPY --from=compilar /app/build /usr/share/nginx/html
# CMD não é necessário, porque a imagemnginx já executa o servidor

