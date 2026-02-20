# 🔐 LAB 2: Dockerfile Seguro

> **Crea un Dockerfile seguro desde cero**

---

## 🎯 Objetivo

Demostrar que puedes:
- ✅ Escribir un Dockerfile
- ✅ Crear usuario non-root
- ✅ Establecer permisos seguros
- ✅ Construir y probar

---

## 📋 Requisitos

- Docker instalado
- Un editor de texto (VS Code, Notepad, etc.)
- LAB 1 completado (recomendado)

---

## 🚀 Pasos

### Paso 1: Crea una Carpeta de Trabajo

```bash
# Windows
mkdir C:\mi-app
cd C:\mi-app

# Linux/macOS
mkdir ~/mi-app
cd ~/mi-app
```

### Paso 2: Crea un Dockerfile

Crea un archivo llamado `Dockerfile` (sin extensión):

```dockerfile
# Usar imagen base
FROM python:3.11-slim

# Instalar como root
RUN apt-get update && apt-get install -y curl

# Crear usuario no-root
RUN useradd -m -s /bin/bash appuser

# Crear directorio
RUN mkdir -p /app && chown appuser:appuser /app

# Cambiar de usuario
USER appuser

# Copiar código
WORKDIR /app
COPY --chown=appuser:appuser app.py .

# Ejecutar
CMD ["python3", "app.py"]
```

### Paso 3: Crea tu App

Crea `app.py`:

```python
import datetime

print("="*40)
print("¡Bienvenido a mi app segura!")
print(f"Hora: {datetime.datetime.now()}")
print("="*40)

print("\nVerificando seguridad...")
import os
print(f"Usuario actual: {os.getenv('USER', 'desconocido')}")

# Simular trabajo
for i in range(3):
    print(f"Procesando... {i+1}/3")

print("\n✅ ¡Éxito!")
```

### Paso 4: Construir la Imagen

```bash
docker build -t mi-app-segura .

# Verás:
# Sending build context to Docker daemon...
# Step 1/7 : FROM python:3.11-slim
# Step 2/7 : RUN apt-get update && apt-get install -y curl
# ...
# Successfully tagged mi-app-segura:latest
```

### Paso 5: Verificar Construcción

```bash
docker images | grep mi-app-segura

# Deberías ver:
# mi-app-segura   latest   a1b2c3d4e5f6   120MB
```

### Paso 6: Ejecutar el Contenedor

```bash
docker run mi-app-segura

# Verás:
# ========================================
# ¡Bienvenido a mi app segura!
# Hora: 2026-02-20 01:59:26.123456
# ========================================
# 
# Verificando seguridad...
# Usuario actual: appuser
# Procesando... 1/3
# Procesando... 2/3
# Procesando... 3/3
# 
# ✅ ¡Éxito!
```

### Paso 7: Verificar Usuario

```bash
docker run mi-app-segura whoami

# Debería imprimir:
# appuser
```

✅ **Esto demuestra que NO estamos corriendo como root**

### Paso 8: Comparar con Inseguro

Crea `Dockerfile.inseguro`:

```dockerfile
FROM python:3.11-slim
RUN apt-get update && apt-get install -y curl
COPY app.py .
# ← Sin usuario, corre como root
CMD ["python3", "app.py"]
```

### Paso 9: Construir Inseguro

```bash
docker build -f Dockerfile.inseguro -t mi-app-insegura .
docker run mi-app-insegura whoami

# Imprime:
# root    ← ¡PELIGRO!
```

### Paso 10: Comparar Usuarios

```bash
# Segura
echo "=== Segura ==="
docker run mi-app-segura whoami

# Insegura
echo "=== Insegura ==="
docker run mi-app-insegura whoami

# Diferencia:
# appuser (segura) ✅
# root (insegura) ❌
```

---

## 🔍 Análisis de Seguridad

### Comando: docker inspect

```bash
docker run -d mi-app-segura sleep 3600
# Obtén el ID del contenedor

docker inspect <ID>

# Busca:
# "User": "appuser"    ← Correcto
# "User": "root"       ← Problema
```

---

## ✅ Verificación

### Checklist:

```
□ Creé un Dockerfile
□ Creé app.py
□ Construí la imagen
□ Ejecuté el contenedor
□ Verifiqué que usa usuario "appuser"
□ Creé versión insegura
□ Verifiqué que insegura usa "root"
□ Comprendí la diferencia
```

Si marcaste TODO → **¡Completaste el LAB!** 🎉

---

## 💡 Conceptos Reforzados

### Usuario Non-Root
```dockerfile
RUN useradd -m appuser    # Crear usuario
USER appuser              # Cambiar a ese usuario
```

### COPY con Propietario
```dockerfile
COPY --chown=appuser:appuser app.py .
# ↑ El archivo ahora pertenece a appuser
```

### Verificación
```bash
docker run imagen whoami      # Ver usuario
docker inspect imagen | grep User  # Ver detalles
```

---

## 🎓 Lo Que Aprendiste

✅ Escribir un Dockerfile seguro  
✅ Crear usuarios non-root  
✅ Cambiar permisos con COPY  
✅ Construir imágenes  
✅ Diferencia entre seguro e inseguro  

---

## 🚀 Próximo LAB

[→ LAB 3: WordPress Docker](./LAB_3_wordpress_docker.md)

---

**⏱️ Tiempo: 1 hora**
