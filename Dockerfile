# Базовый образ
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env

# Установка директории приложения
WORKDIR /app

# Копирование файлов проекта в контейнер
COPY . ./

# Восстановление пакетов NuGet и сборка проекта
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Образ для запуска приложения
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Установка директории приложения
WORKDIR /app

# Копирование скомпилированных файлов проекта в контейнер
COPY --from=build-env /app/out .

# Запуск приложения при запуске контейнера
ENTRYPOINT ["dotnet", "WebApplication1.dll"]