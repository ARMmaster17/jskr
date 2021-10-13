#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["jskr/jskr.csproj", "jskr/"]
RUN dotnet restore "jskr/jskr.csproj"
COPY . .
WORKDIR "/src/jskr"
RUN dotnet build "jskr.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "jskr.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "jskr.dll"]