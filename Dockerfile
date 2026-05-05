# Использование последней версии Node.js
FROM node:22-alpine
# Задаётся рабочая директория в контейнере
WORKDIR /app
# Копируются package.json и package-lock.json
COPY package*.json ./
# Установка зависимостей
RUN npm ci
# Копирование всех файлов из локального каталога в контейнер
COPY . .
# Открывает порт 3000 в контейнере (порт React по умолчанию). 
EXPOSE 5173
# Сообщает Docker о необходимости запуска npm start при запуске контейнера
CMD ["npm", "run", "dev", "--", "--host"]
