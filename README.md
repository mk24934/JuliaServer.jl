# JuliaServer.jl
A Julia server to live within Multilingual backend

## Docker commands used

```
docker build --tag julia_server:latest .
docker run -d -it -p 8000:8000 -name julia_server julia_server
docker exec -it julia_server bash
```