FROM node:22-alpine
WORKDIR /app/server
COPY server/package.json ./package.json
RUN npm install --omit=dev --no-audit --no-fund
COPY server/server.js ./server.js
ENV NODE_ENV=production
ENV PORT=8080
ENV DATA_DIR=/data
RUN mkdir -p /data && chown -R node:node /data /app
USER node
EXPOSE 8080
CMD ["node", "server.js"]
