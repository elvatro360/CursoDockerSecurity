# 🎯 LAB 1: Tu Primer Contenedor

> **Crea, ejecuta y controla tu primer contenedor**

---

## 🎯 Objetivo

Demostrar que puedes:
- ✅ Descargar una imagen
- ✅ Crear un contenedor
- ✅ Ejecutar comandos
- ✅ Detener y eliminar

---

## 📋 Requisitos

- Docker instalado y funcionando
- Terminal/PowerShell/CMD
- Módulo 1 completado (recomendado)

---

## 🚀 Pasos

### Paso 1: Verifica Docker

```bash
docker --version
# Docker version 20.10.21, build baeda1f
```

### Paso 2: Tu Primer "Hola Mundo"

```bash
docker run hello-world
```

**Qué ves:**
```
Hello from Docker!

This message shows that your installation appears to be working correctly.
```

### Paso 3: Tu Primer Ubuntu

```bash
docker run -it ubuntu bash
```

**Ahora estás DENTRO del contenedor:**
```bash
root@xyz123:/#
```

**Prueba estos comandos:**
```bash
ls                    # Ver archivos
pwd                   # Ubicación actual
whoami                # Usuario actual (root)
cat /etc/os-release   # Ver el SO
date                  # Fecha y hora
echo "¡Hola Docker!"
```

**Para salir:**
```bash
exit
```

### Paso 4: Ver Tus Contenedores

```bash
docker ps -a
```

**Verás:**
```
CONTAINER ID   IMAGE          STATUS
a1b2c3d4e5f6   hello-world    Exited 5 minutes ago
x9y8z7w6v5u4   ubuntu         Exited 2 minutes ago
```

### Paso 5: Ejecutar en Segundo Plano

```bash
# Inicia un contenedor que duerme
docker run -d --name dormilón ubuntu sleep 3600

# Verifica que está corriendo
docker ps
```

**Verás:**
```
CONTAINER ID   NAMES        STATUS
p0q1r2s3t4u5   dormilón     Up 10 seconds
```

### Paso 6: Ver Logs

```bash
docker logs dormilón
# (vacío, porque solo está durmiendo)
```

### Paso 7: Detener el Contenedor

```bash
docker stop dormilón

# Verificar que se detuvo
docker ps
# No lo ves en la lista (está parado)

docker ps -a
# Aquí lo ves con "Exited"
```

### Paso 8: Reiniciar el Contenedor

```bash
docker start dormilón

# Verificar
docker ps
# Ahora está "Up" de nuevo
```

### Paso 9: Eliminar Contenedores

```bash
# Detén primero
docker stop dormilón

# Elimina
docker rm dormilón

# Verifica
docker ps -a
# Desapareció
```

### Paso 10: Limpiar Todo

```bash
# Ver qué hay
docker ps -a

# Eliminar todos los parados (peligroso si no estás seguro)
docker container prune

# Te pregunta:
# WARNING! This will remove all stopped containers.
# Are you sure? [y/N]

# Responde: y
```

---

## ✅ Verificación

### Checklist:

```
□ Ejecuté docker --version
□ Ejecuté hello-world
□ Entré en Ubuntu interactivo
□ Ejecuté comandos dentro del contenedor
□ Salí del contenedor
□ Vi los contenedores con docker ps -a
□ Ejecuté un contenedor en segundo plano
□ Lo detuve y reinicié
□ Lo eliminé
□ Limpié todo
```

Si marcaste TODO → **¡Completaste el LAB!** 🎉

---

## 💡 Conceptos Reforzados

### IMAGEN vs CONTENEDOR
```
docker run ubuntu    ← usa la IMAGEN ubuntu
             ↓
        Crea UN CONTENEDOR que ejecuta bash
```

### Estados del Contenedor
```
docker run      → CREADO Y EJECUTADO
docker stop     → PARADO (puede reiniciarse)
docker rm       → ELIMINADO (adiós datos)
```

### Comando Útil
```bash
docker ps -a      # VER TODO
docker ps         # Solo los que corren
docker logs       # Ver qué pasó
docker stop       # Detener sin eliminar
docker rm         # Eliminar completamente
```

---

## 🎓 Lo Que Aprendiste

✅ Docker run crea y ejecuta  
✅ docker ps -a ve todo  
✅ docker stop es reversible  
✅ docker rm es permanente  
✅ Puedes ver logs con docker logs  

---

## 🚀 Próximo LAB

[→ LAB 2: Dockerfile Seguro](./LAB_2_dockerfile_seguro.md)

---

**⏱️ Tiempo: 30-45 minutos**
