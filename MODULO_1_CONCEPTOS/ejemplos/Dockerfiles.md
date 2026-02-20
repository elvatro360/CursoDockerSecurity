# 🔧 Ejemplos Dockerfile

## 1. Dockerfile Básico (Inseguro ❌)

```dockerfile
FROM python:3.11

RUN pip install flask

COPY app.py .

CMD ["python", "app.py"]
```

**Problemas:**
- ❌ Corre como root
- ❌ Sin permisos especificados
- ❌ Sin limites de recursos

---

## 2. Dockerfile Seguro ✅

```dockerfile
FROM python:3.11-slim

# Instalar como root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Crear usuario
RUN useradd -m -s /bin/bash appuser

# Copiar con permisos correctos
COPY --chown=appuser:appuser app.py /app/

# Cambiar usuario
USER appuser

WORKDIR /app

CMD ["python", "app.py"]
```

**Mejoras:**
- ✅ Usuario non-root
- ✅ Permisos correctos
- ✅ Imagen slim (más pequeña)
- ✅ Limpieza de cache apt

---

## 3. Multi-Stage Seguro 🚀

```dockerfile
# ETAPA 1: Builder
FROM python:3.11-slim AS builder

WORKDIR /build
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# ETAPA 2: Runtime
FROM python:3.11-slim

RUN useradd -m -s /bin/bash appuser

COPY --from=builder --chown=appuser:appuser /root/.local /home/appuser/.local
COPY --chown=appuser:appuser app.py /app/

USER appuser
WORKDIR /app

ENV PATH=/home/appuser/.local/bin:$PATH

CMD ["python", "app.py"]
```

---

## 4. Node.js Seguro

```dockerfile
FROM node:18-alpine

RUN addgroup -g 1000 nodejs && \
    adduser -D -u 1000 -G nodejs nodejs

WORKDIR /app

COPY --chown=nodejs:nodejs package*.json ./

RUN npm ci --only=production

COPY --chown=nodejs:nodejs . .

USER nodejs

EXPOSE 3000

CMD ["node", "server.js"]
```

---

## 5. Con Health Check

```dockerfile
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3

RUN useradd -m appuser

COPY --chown=appuser:appuser app.py /app/

USER appuser

WORKDIR /app

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD python3 -c "import requests; requests.get('http://localhost:8000/health')"

CMD ["python3", "app.py"]
```

---

Guardado en `MODULO_1_CONCEPTOS/ejemplos/Dockerfiles.md`
