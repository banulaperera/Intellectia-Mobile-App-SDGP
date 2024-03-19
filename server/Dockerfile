FROM node:20.11-alpine3.19
ENV ACCESS_TOKEN_KEY="INT906756GT"
ENV REFRESH_TOKEN_KEY="JKQWT654389FO"
ENV OPENAI_API_KEY="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"
ENV BASE_API="/api/v1"
ENV YOUTUBE_API_KEY="AIzaSyB-XPyopF3kpzKNk8h7YO8WjctCTbLeYr4"
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm uninstall bcrypt
RUN npm i bcrypt
EXPOSE 3000
CMD [ "npm", "run", "start" ]
