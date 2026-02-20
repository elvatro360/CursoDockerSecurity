# 🔧 Comandos Básicos - Módulo 1, Parte 3

> **Aprende los comandos esenciales de Docker**

---

## 🎯 Objetivo

Conocer los 10 comandos principales que usarás en Docker.

---

## 📋 Los Comandos

### 1️⃣ `docker --version`
**¿Qué hace?** Verifica que Docker está instalado

```bash
docker --version
# Docker version 20.10.21, build baeda1f
```

---

### 2️⃣ `docker images`
**¿Qué hace?** Ve todas las imágenes que tienes

```bash
docker images

# REPOSITORY    TAG       IMAGE ID      SIZE
# ubuntu        latest    3b418d7b      77.8MB
# python        3.11      a1d3c5e6      912MB
# hello-world   latest    d1165f22      13.3kB
```

**Explicación:**
- `REPOSITORY`: Nombre de la imagen
- `TAG`: Versión (latest = la más nueva)
- `IMAGE ID`: Identificador único
- `SIZE`: Cuánto espacio ocupa

---

### 3️⃣ `docker pull nombre-imagen`
**¿Qué hace?** Descarga una imagen desde Docker Hub

```bash
docker pull ubuntu
# Using default tag: latest
# Pulling from library/ubuntu
# Status: Downloaded newer image for ubuntu:latest
```

**Casos de uso:**
```bash
docker pull ubuntu              # Versión latest
docker pull ubuntu:22.04        # Versión específica
docker pull python:3.11         # Python 3.11
docker pull nginx:1.25          # Nginx 1.25
```

---

### 4️⃣ `docker run [opciones] nombre-imagen`
**¿Qué hace?** Crea y ejecuta un contenedor

#### Forma básica:
```bash
docker run ubuntu echo "Hola"
```

#### Interactivo (puedes escribir comandos):
```bash
docker run -it ubuntu bash
# Ahora estás DENTRO del contenedor
# Prueba: ls, whoami, exit
```

#### Con nombre:
```bash
docker run --name mi-contenedor ubuntu
```

#### En segundo plano (detached):
```bash
docker run -d nginx
# d = detached
# Devuelve el ID y sigue en terminal
```

#### Mapeo de puertos:
```bash
docker run -p 8080:80 nginx
# Puerto local 8080 → Puerto contenedor 80
```

#### Con variables de ambiente:
```bash
docker run -e PASSWORD="secret" postgres
```

#### Con límites de memoria:
```bash
docker run --memory="512m" ubuntu
```

---

### 5️⃣ `docker ps`
**¿Qué hace?** Ve contenedores que están CORRIENDO

```bash
docker ps

# CONTAINER ID   IMAGE      COMMAND   CREATED        STATUS
# a1b2c3d4e5f6   ubuntu     "bash"    5 seconds ago  Up 5 seconds
```

---

### 6️⃣ `docker ps -a`
**¿Qué hace?** Ve TODOS los contenedores (incluso parados)

```bash
docker ps -a

# CONTAINER ID   IMAGE      STATUS
# a1b2c3d4e5f6   ubuntu     Up 5 minutes
# x9y8z7w6v5u4   nginx      Exited 2 hours ago
# m5n6o7p8q9r0   postgres   Exited 1 day ago
```

---

### 7️⃣ `docker stop nombre-o-ID`
**¿Qué hace?** Detiene un contenedor en ejecución

```bash
docker stop a1b2c3d4e5f6
# a1b2c3d4e5f6

docker stop mi-contenedor
# mi-contenedor
```

---

### 8️⃣ `docker start nombre-o-ID`
**¿Qué hace?** Reinicia un contenedor parado

```bash
docker start a1b2c3d4e5f6
docker start mi-contenedor
```

---

### 9️⃣ `docker rm nombre-o-ID`
**¿Qué hace?** Elimina un contenedor (¡CUIDADO!)

```bash
docker rm a1b2c3d4e5f6
# a1b2c3d4e5f6

# Para borrar todos los parados:
docker container prune
```

---

### 🔟 `docker rmi nombre-imagen`
**¿Qué hace?** Elimina una imagen

```bash
docker rmi ubuntu
# Untagged: ubuntu:latest
# Deleted: sha256:...

# Para borrar todas las no usadas:
docker image prune
```

---

## 🎓 Resumen de Comandos

```bash
# VER
docker images              # Ver imágenes
docker ps                  # Ver contenedores activos
docker ps -a               # Ver todos los contenedores

# DESCARGAR
docker pull nombre         # Descargar imagen

# CREAR Y EJECUTAR
docker run nombre          # Crear y ejecutar
docker run -it nombre bash # Interactivo

# CONTROLAR
docker stop nombre         # Detener
docker start nombre        # Reiniciar
docker pause nombre        # Pausar
docker unpause nombre      # Reanudar

# LIMPIAR
docker rm nombre           # Borrar contenedor
docker rmi nombre          # Borrar imagen
docker system prune        # Limpiar todo
```

---

## 💡 Consejos

### 1. Siempre Limpia
```bash
# De vez en cuando:
docker container prune     # Borra contenedores parados
docker image prune         # Borra imágenes sin usar
```

### 2. Usa Nombres Descriptivos
```bash
# ❌ Malo:
docker run postgres

# ✅ Bueno:
docker run --name mi-base-datos postgres
```

### 3. Mapea Puertos si Necesitas Acceder
```bash
# Para un servidor web:
docker run -p 8080:80 nginx
# Ahora accedes en: http://localhost:8080
```

### 4. Lee los Logs
```bash
docker logs nombre-contenedor
# Ver qué pasó en el contenedor
```

---

## 🎯 Ejercicio

### Prueba estos comandos:

```bash
# 1. Ver tu versión
docker --version

# 2. Ver imágenes (probablemente vacío)
docker images

# 3. Descargar una imagen
docker pull hello-world

# 4. Ver que la descargó
docker images

# 5. Ejecutar el contenedor
docker run hello-world

# 6. Ver contenedores (incluye parados)
docker ps -a

# 7. Limpiar
docker container prune
```

---

## ✅ Lo Que Aprendiste

✅ Comandos para ver imágenes y contenedores  
✅ Cómo descargar imágenes (pull)  
✅ Cómo crear y ejecutar contenedores (run)  
✅ Cómo controlar contenedores (stop, start, rm)  
✅ Cómo limpiar y mantener el sistema  

---

## 🚀 Próximo: Ejercicios del Módulo 1

[→ Ejercicios Prácticos](./ejercicios.md)

---

**⏱️ Tiempo de lectura: 12 minutos**
