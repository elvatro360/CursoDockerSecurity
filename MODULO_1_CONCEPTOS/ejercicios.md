# ✏️ Ejercicios - Módulo 1

> **Practica lo que aprendiste**

---

## 🎯 Objetivo

Ejecutar comandos reales de Docker en tu computadora.

---

## ✅ Ejercicio 1: Verificar Instalación

### Tarea:
Comprueba que Docker funciona correctamente.

### Pasos:
```bash
# Ejecuta:
docker --version

# Deberías ver:
# Docker version 20.10.21, build baeda1f
```

### Verificación:
✅ Si ves el número de versión → **¡Funciona!**  
❌ Si ves "command not found" → Reinstala Docker

---

## ✅ Ejercicio 2: Ver Imágenes Actuales

### Tarea:
Mira qué imágenes tienes en tu sistema.

### Pasos:
```bash
docker images
```

### Resultado esperado:
Si es la primera vez, verás una tabla vacía o pocas imágenes.

```
REPOSITORY    TAG       IMAGE ID      SIZE
# (vacío o poquito contenido)
```

---

## ✅ Ejercicio 3: Tu Primer Contenedor

### Tarea:
Ejecuta el clásico "Hello World" de Docker.

### Pasos:
```bash
docker run hello-world
```

### Resultado esperado:
```
Hello from Docker!

This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub
...
```

### ✅ Verificación:
¿Viste "Hello from Docker!"? → **¡Excelente!**

---

## ✅ Ejercicio 4: Ver Contenedores

### Tarea:
Mira el contenedor que acabas de crear.

### Pasos:
```bash
# Ver solo los que están corriendo
docker ps

# Ver todos (incluso los parados)
docker ps -a
```

### Resultado esperado:
```
CONTAINER ID   IMAGE         STATUS
xyz123         hello-world   Exited 5 seconds ago
```

### ✅ Verificación:
¿Ves el contenedor hello-world? → **¡Correcto!**

---

## ✅ Ejercicio 5: Contenedor Interactivo

### Tarea:
Entra en un contenedor Ubuntu y ejecuta comandos.

### Pasos:
```bash
# Entra en Ubuntu interactivamente
docker run -it ubuntu bash

# Ahora estás DENTRO del contenedor. Prueba:
ls              # Ver archivos
pwd             # Dónde estás
whoami          # Quién eres
date            # Fecha y hora
cat /etc/os-release  # Ver el SO

# Para salir:
exit
```

### ✅ Verificación:
¿Ejecutaste comandos dentro del contenedor? → **¡Perfecto!**

---

## ✅ Ejercicio 6: Descargar Una Imagen

### Tarea:
Descarga la imagen de Python.

### Pasos:
```bash
docker pull python:3.11

# Verás:
# Pulling from library/python
# 3b418d7b: Pull complete
# Status: Downloaded newer image for python:3.11
```

### Verificación:
```bash
docker images

# Deberías ver:
# python    3.11    a1b2c3d4    912MB
```

---

## ✅ Ejercicio 7: Ejecutar Python en un Contenedor

### Tarea:
Ejecuta un script Python dentro de un contenedor.

### Pasos:
```bash
# Forma 1: Comando simple
docker run python:3.11 python -c "print('¡Hola desde Docker!')"

# Forma 2: Script interactivo
docker run -it python:3.11 python
# >>> print("¡Funciona!")
# ¡Funciona!
# >>> exit()
```

### ✅ Verificación:
¿Viste el output de Python? → **¡Bien hecho!**

---

## ✅ Ejercicio 8: Con Nombre Personalizado

### Tarea:
Crea un contenedor con un nombre.

### Pasos:
```bash
docker run --name mi-ubuntu ubuntu echo "Soy especial"

# Ver todos los contenedores
docker ps -a

# Deberías ver:
# CONTAINER ID   NAMES        STATUS
# xyz123         mi-ubuntu    Exited 5 seconds ago
```

### ✅ Verificación:
¿Ves "mi-ubuntu" en la lista? → **¡Correcto!**

---

## ✅ Ejercicio 9: Limpiar Contenedores

### Tarea:
Elimina contenedores que no usas.

### Pasos:
```bash
# Ver todos
docker ps -a

# Eliminar uno específico
docker rm mi-ubuntu

# O eliminar todos los parados de una vez
docker container prune

# (Te preguntará "¿Estás seguro?")
# Responde: y
```

### ✅ Verificación:
```bash
docker ps -a
# Deberían desaparecer
```

---

## ✅ Ejercicio 10: Medir Uso de Recursos

### Tarea:
Ver cuánta memoria usa un contenedor.

### Pasos:
```bash
# 1. Inicia un contenedor en segundo plano
docker run -d --name test-servidor ubuntu sleep 3600

# 2. Ver su uso de recursos
docker stats test-servidor

# 3. Detener cuando acabes
docker stop test-servidor

# 4. Ver estadísticas históricas
docker stats --no-stream
```

### ✅ Verificación:
¿Viste el uso de CPU y memoria? → **¡Excelente!**

---

## 🎯 Resumen de Ejercicios

| # | Ejercicio | Objetivo | Comando |
|---|-----------|----------|---------|
| 1 | Verificar | Confirmar instalación | `docker --version` |
| 2 | Ver imágenes | Listar lo que tienes | `docker images` |
| 3 | Hello World | Tu primer contenedor | `docker run hello-world` |
| 4 | Ver contenedores | Listar contenedores | `docker ps -a` |
| 5 | Interactivo | Entrar en Ubuntu | `docker run -it ubuntu bash` |
| 6 | Descargar | Obtener imagen | `docker pull python:3.11` |
| 7 | Python | Ejecutar código | `docker run python:3.11 python -c ...` |
| 8 | Nombre | Contenedor con nombre | `docker run --name ...` |
| 9 | Limpiar | Eliminar contenedores | `docker rm ...` |
| 10 | Estadísticas | Ver recursos | `docker stats` |

---

## 🏆 ¿Completaste Todo?

Si respondiste ✅ en todos los ejercicios, **¡Felicidades!**

Ahora comprendes:
✅ Cómo instalar y verificar Docker  
✅ Cómo descargar imágenes  
✅ Cómo crear y ejecutar contenedores  
✅ Cómo controlar y limpiar  

---

## 🚀 Próximo Paso

### [Módulo 2: Seguridad Básica →](../MODULO_2_SEGURIDAD_BASICA/README.md)

---

## 🆘 Ayuda

### "command not found"
→ Docker no está instalado o no en el PATH  
→ Reinicia tu terminal  
→ Reinicia Docker Desktop (Windows/macOS)

### "Cannot connect to daemon"
→ Docker Desktop no está abierto  
→ En Linux: `sudo systemctl start docker`

### Contenedor no ejecuta el comando
→ Verifica que usas `-it` para interactivo  
→ Verifica la imagen existe: `docker images`

---

**⏱️ Tiempo de práctica: 30-45 minutos**
