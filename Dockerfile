# Imagen base
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app

# Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /out

# Runtime
FROM base
WORKDIR /app
COPY --from=build /out .
ENTRYPOINT ["dotnet", "HolaMundoDevops.dll"]
