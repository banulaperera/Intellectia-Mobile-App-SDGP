FROM node:20.11-alpine3.19
RUN --mount=type=secret,id=ACCESS_TOKEN_KEY \
  cat /run/secrets/ACCESS_TOKEN_KEY
RUN --mount=type=secret,id=BASE_API \
  cat /run/secrets/BASE_API
RUN --mount=type=secret,id=OPENAI_API_KEY \
  cat /run/secrets/OPENAI_API_KEY
RUN --mount=type=secret,id=REFRESH_TOKEN_KEY \
  cat /run/secrets/REFRESH_TOKEN_KEY
RUN --mount=type=secret,id=YOUTUBE_API_KEY \
  cat /run/secrets/YOUTUBE_API_KEY
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm uninstall bcrypt
RUN npm i bcrypt
EXPOSE 3000
CMD [ "npm", "run", "start" ]