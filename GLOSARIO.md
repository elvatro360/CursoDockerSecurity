# 📖 Glosario - Palabras Importantes de Docker

> **Aprende el vocabulario de Docker explicado como para niños**

---

## 🎯 Conceptos Principales

### 🐳 **Docker**
**¿Qué es?** Un sistema que empacar aplicaciones en "cajas" especiales.

**Analogía:** Como una caja mágica que lleva tu aplicación con TODO lo necesario para funcionar en cualquier lugar.

---

### 📦 **Imagen (Image)**
**¿Qué es?** Un "plano" o "receta" para hacer contenedores.

**Analogía:** Como un molde para hacer pasteles. El molde sirve para hacer muchos pasteles iguales.

---

### 🎁 **Contenedor (Container)**
**¿Qué es?** Una "caja" en ejecución basada en una imagen.

**Analogía:** Si la imagen es la receta, el contenedor es el pastel que acabas de hacer.

**Características:**
- Es temporal (se borra cuando lo cierras)
- Es aislado (no afecta tu PC)
- Es rápido (segundos para iniciarse)

---

### 🏭 **Dockerfile**
**¿Qué es?** Un archivo de texto con instrucciones para construir una imagen.

**Ejemplo simple:**
```dockerfile
FROM ubuntu              # Base
RUN apt-get install python3  # Instala Python
COPY app.py /app.py     # Copia tu código
CMD ["python", "/app.py"]  # Ejecuta
```

---

### 🔨 **Build (Construir)**
**¿Qué es?** Crear una imagen desde un Dockerfile.

**Comando:**
```bash
docker build -t nombre-imagen .
```

---

### ▶️ **Run (Ejecutar)**
**¿Qué es?** Iniciar un contenedor desde una imagen.

**Comando:**
```bash
docker run nombre-imagen
```

---

## 🔐 Conceptos de Seguridad

### 🚫 **Root**
**¿Qué es?** El usuario "super poderoso" en Linux.

**Peligro:** Si un atacante entra como root, ¡puede borrar todo!

**Solución:** Usar un usuario normal:
```dockerfile
RUN useradd -m appuser
USER appuser
```

---

### 👤 **Usuario No-Root**
**¿Qué es?** Un usuario normal sin permisos especiales.

**Ventaja:** Si atacan este usuario, solo pueden hacer cosas limitadas.

---

### 🔐 **Permisos (Permissions)**
**¿Qué es?** Las reglas que dicen quién puede leer/escribir/ejecutar un archivo.

**Notación:**
```
-rwxr-xr-x
 ││││││└─ Otros: x (ejecutar)
 │││││└── Otros: r (leer)
 ││││└─── Grupo: x (ejecutar)
 │││└──── Grupo: r (leer)
 ││└───── Grupo: w (escribir)
 │└────── Usuario: x (ejecutar)
 └─────── Usuario: r (leer) + w (escribir)
```

---

### 🔒 **Secret (Secreto)**
**¿Qué es?** Información sensible (contraseñas, tokens, claves).

**❌ NUNCA hagas:**
```bash
docker run -e PASSWORD="admin123" mi-app
```

**✅ SIEMPRE usa:**
```bash
docker secret create db_password password.txt
```

---

### 🛡️ **Vulnerability (Vulnerabilidad)**
**¿Qué es?** Un "bichillo" o error en el software que un atacante puede usar.

**Ejemplo:**
```
CVE-2023-12345: Error en Apache que permite entrar sin contraseña
```

**Solución:**
```bash
docker scan nombre-imagen     # Escanear vulnerabilidades
```

---

## 🏗️ Conceptos de Construcción

### 📚 **Base Image**
**¿Qué es?** La imagen de partida.

**Ejemplos:**
```dockerfile
FROM ubuntu:22.04     # Sistema completo
FROM python:3.11      # Python preinstalado
FROM alpine:latest    # Muy ligero (~5MB)
```

---

### 🎯 **Entry Point**
**¿Qué es?** El comando que se ejecuta al iniciar el contenedor.

```dockerfile
ENTRYPOINT ["/app/servidor"]
CMD ["--port", "8080"]
```

---

### 📋 **Layer (Capa)**
**¿Qué es?** Cada línea de un Dockerfile crea una "capa".

**Por qué importa:** Las capas se cachean y reutilizan.

---

### 🏗️ **Multi-Stage Build**
**¿Qué es?** Usar múltiples imágenes intermedias para crear una más ligera.

**Beneficio:** Imágenes mucho más pequeñas (500MB → 50MB).

**Ejemplo:**
```dockerfile
# ETAPA 1: Compilar
FROM golang:latest AS builder
RUN cd /src && go build -o app

# ETAPA 2: Correr (ligero)
FROM alpine:latest
COPY --from=builder /src/app /app
```

---

## 📦 Conceptos de Contenedores

### 🌐 **Network (Red)**
**¿Qué es?** Las conexiones entre contenedores.

**Tipos:** bridge, host, overlay, none

---

### 📁 **Volume (Volumen)**
**¿Qué es?** Una carpeta compartida entre tu PC y el contenedor.

**Uso:**
```bash
docker run -v /ruta/pc:/ruta/contenedor mi-app
```

---

### 🎚️ **Resource Limits**
**¿Qué es?** Establecer máximos de CPU y memoria.

**Uso:**
```bash
docker run --memory="512m" --cpus="1.0" mi-app
```

---

## 🐋 Docker Compose

### 📄 **docker-compose.yml**
**¿Qué es?** Un archivo que describe múltiples contenedores.

**Ejemplo:**
```yaml
version: '3'
services:
  web:
    image: mi-app
  db:
    image: postgres
```

---

## 🎓 Resumen Rápido

| Término | Es... | Analogía |
|---------|-------|----------|
| Imagen | Un plano | Receta |
| Contenedor | Un programa | El pastel hecho |
| Dockerfile | Instrucciones | Ingredientes |
| Volume | Carpeta compartida | Carpeta en la nube |
| Network | Conexión | Teléfono entre amigos |
| Secret | Info segura | Contraseña guardada |

---

<div align="center">

**¡Ahora entiendes el vocabulario! Continúa aprendiendo.** 📚

</div>
