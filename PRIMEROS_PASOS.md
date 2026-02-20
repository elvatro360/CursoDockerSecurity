# 🎬 Primeros Pasos - Docker Security Course

> **¡Prepárate para aprender Docker de forma segura!**

---

## 📋 Antes de Empezar

### ✅ Checklist Pre-Curso

Asegúrate de que tienes:

- [ ] Computadora con Windows, macOS o Linux
- [ ] Conexión a Internet
- [ ] 5 GB de espacio libre en disco
- [ ] Ganas de aprender 🎉

---

## 1️⃣ Instalar Docker

### 💻 En Windows

#### Opción A: Docker Desktop (Recomendado)
```
1. Ve a: https://www.docker.com/products/docker-desktop
2. Descarga "Docker Desktop for Windows"
3. Ejecuta el instalador
4. Abre PowerShell como Administrador
5. Reinicia tu computadora
```

#### Verificar instalación:
```powershell
docker --version
```

---

### 🍎 En macOS

```bash
# Descarga de: https://www.docker.com/products/docker-desktop
docker --version
```

---

### 🐧 En Linux (Ubuntu/Debian)

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
sudo reboot
docker --version
```

---

## 2️⃣ Verificar que Todo Funciona

### Test #1: ¡Hola Mundo!

```bash
docker run hello-world
```

Si ves: `Hello from Docker!` → ✅ **¡Funciona!**

### Test #2: Descargar una imagen

```bash
docker pull ubuntu
```

### Test #3: Crear un contenedor interactivo

```bash
docker run -it ubuntu bash
# Prueba: ls, echo "Hola", exit
```

---

## 3️⃣ Comandos Básicos para Empezar

```bash
docker ps              # Ver contenedores activos
docker ps -a           # Ver todos los contenedores
docker images          # Ver imágenes descargadas
docker stop nombre     # Detener un contenedor
docker rm nombre       # Eliminar un contenedor
docker info            # Información de Docker
```

---

## 4️⃣ Tu Primer Dockerfile

Crea un archivo llamado `Dockerfile`:

```dockerfile
FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3
RUN echo 'print("¡Hola desde Docker!")' > app.py
CMD ["python3", "app.py"]
```

Luego ejecuta:
```bash
docker build -t mi-app .
docker run mi-app
```

Resultado: `¡Hola desde Docker!`

---

## 5️⃣ ¿Problemas?

- "docker: command not found" → Reinicia Docker Desktop
- "permission denied" → `sudo usermod -aG docker $USER` + reinicia
- "Cannot connect to daemon" → Abre Docker Desktop

---

## 🚀 Próximos Pasos

Cuando todo funcione, comienza con:

### 📖 [Módulo 1: Conceptos Básicos](../MODULO_1_CONCEPTOS/1_QUE_ES_DOCKER.md)

---

<div align="center">

**"La mejor forma de aprender es haciendo" 🐳**

</div>
