# Базовый образ
FROM mcr.microsoft.com/dotnet/aspnet:6.0
# Определение аргумента для пути к проекту
ARG BINARY_PATH

# Установка директории приложения
WORKDIR /app

# Копирование файлов проекта в контейнер
COPY ${APP_PATH} ./

# Запуск приложения при запуске контейнера
ENTRYPOINT ["dotnet", "WebApplication1.dll"]
