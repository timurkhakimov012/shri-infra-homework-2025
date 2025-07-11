# Dockerfile
FROM node:22.13.1

# 1. Рабочая директория
WORKDIR /app

# 2. Копируем package-манифесты и ставим все зависимости
COPY package.json package-lock.json ./
RUN npm ci

# 3. Копируем весь код и собираем клиент (webpack → dist/)
COPY . .
RUN npm run build

# 4. Документируем порт
EXPOSE 3000

# 5. Запускаем ваш сервер (в package.json – "start": "nodemon ./src/server/index.ts")
CMD ["npm", "start"]
