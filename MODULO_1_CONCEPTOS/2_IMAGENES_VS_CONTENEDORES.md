# 🖼️ Imágenes vs Contenedores - Módulo 1, Parte 2

> **La diferencia más importante de Docker**

---

## 🎯 Objetivo

Entender que IMAGEN y CONTENEDOR son DOS COSAS DIFERENTES.

Esta es la idea más importante del curso. Léelo bien.

---

## 📦 IMAGEN: El Molde

### ¿Qué es una IMAGEN?

Una **IMAGEN** es:
- ✅ Un archivo estático (no cambia)
- ✅ Un "molde" o "plano"
- ✅ Describe QUÉ va en un contenedor
- ✅ No se ejecuta por sí sola
- ✅ Se puede compartir y reutilizar

### Ejemplo de IMAGEN

```
Nombre: "ubuntu-python-miapp"

Descripción:
├─ Sistema operativo: Ubuntu 22.04
├─ Lenguaje: Python 3.11
├─ Librerías: Flask, PostgreSQL driver
├─ Mi aplicación: app.py
├─ Puerto: 8080
└─ Usuario: appuser (no root)
```

### Cómo Guardamos una IMAGEN

Escribimos un `Dockerfile`:

```dockerfile
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py /app/app.py

USER appuser
CMD ["python3", "/app/app.py"]
```

---

## 🎁 CONTENEDOR: El Resultado

### ¿Qué es un CONTENEDOR?

Un **CONTENEDOR** es:
- ✅ Una IMAGEN en ejecución
- ✅ "Viva" (está corriendo ahora)
- ✅ Temporal (puede desaparecer)
- ✅ Aislada (no afecta tu PC)
- ✅ Rápida (arranca en segundos)

### Ejemplo de CONTENEDOR

```
Contenedor #1 (corriendo):
├─ Imagen: ubuntu-python-miapp
├─ Estado: En ejecución
├─ PID: 42857
├─ Memoria usada: 128 MB
├─ IP: 172.17.0.2
└─ Puerto: 8080

Contenedor #2 (corriendo):
├─ Imagen: ubuntu-python-miapp
├─ Estado: En ejecución
├─ PID: 42858
├─ Memoria usada: 125 MB
├─ IP: 172.17.0.3
└─ Puerto: 8080

Contenedor #3 (parado):
├─ Imagen: ubuntu-python-miapp
├─ Estado: Exited
├─ Creado: hace 1 hora
└─ Puede reiniciarse
```

---

## 🔄 La Relación

### 1️⃣ Haces una IMAGEN

```
Dockerfile (archivo de texto)
        ↓
docker build (construir)
        ↓
IMAGEN (archivo estático)
```

### 2️⃣ Ejecutas un CONTENEDOR

```
IMAGEN (molde)
   ↓ docker run
CONTENEDOR #1 (corriendo) ✅
   ↓ docker run
CONTENEDOR #2 (corriendo) ✅
   ↓ docker run
CONTENEDOR #3 (parado) ⏸️
```

---

## 📊 Comparación Completa

| Característica | IMAGEN | CONTENEDOR |
|--|--|--|
| **¿Qué es?** | Un plano | El resultado |
| **¿Se ejecuta?** | No | Sí |
| **¿Es permanente?** | Sí (se guarda) | Temporal (se borra) |
| **¿Cambia?** | No (es fija) | Sí (genera datos) |
| **¿Cuántos de una?** | 1 imagen | Muchos contenedores |
| **¿Tamaño?** | 100-500 MB | Actualmente: 50-200 MB |
| **¿Se reutiliza?** | Infinitas veces | Una sola ejecución |

---

## 🏭 En la Fábrica

### Analogía: Fábrica de Juguetes

#### IMAGEN = Molde plástico
```
┌─────────────────────────┐
│   MOLDE DE JUGUETE      │
│  (en la estantería)     │
│                         │
│  • No se ejecuta        │
│  • Es permanente        │
│  • Se reutiliza         │
│  • Describe el juguete  │
└─────────────────────────┘
```

#### CONTENEDOR = Juguete fabricado
```
Juguete #1: Rojo, en funcionamiento
Juguete #2: Azul, en funcionamiento
Juguete #3: Verde, roto y guardado
Juguete #4: Amarillo, nuevo

Todos del MISMO molde (IMAGEN)
```

---

## 💾 Almacenamiento

### IMAGEN: Se Guarda en Disco

```bash
docker images
# REPOSITORY    TAG     IMAGE ID    SIZE
# mi-app        latest  a1b2c3d4e5  256MB  ← GUARDADA
# ubuntu        22.04   f6g7h8i9j0  78MB   ← GUARDADA
```

### CONTENEDOR: Puede Desaparecer

```bash
docker ps -a
# CONTAINER ID    STATUS
# xyz123           Exited 2 hours ago  ← DATOS PERDIDOS si lo eliminas

docker rm xyz123  # ← Se borra completamente
```

---

## 🎯 Caso Práctico

### Quiero ejecutar Ubuntu

#### Con 1 IMAGEN puedo:

```bash
docker pull ubuntu

# IMAGEN descargada una sola vez
# 78 MB guardados en disco
```

#### Pero ejecutar muchos CONTENEDORES:

```bash
docker run -it ubuntu bash        # Contenedor 1 ✅
docker run -it ubuntu bash        # Contenedor 2 ✅
docker run -it ubuntu bash        # Contenedor 3 ✅
docker run -it ubuntu bash        # Contenedor 4 ✅
docker run -it ubuntu bash        # Contenedor 5 ✅

# 5 contenedores de 1 imagen
# Todos funcionan "al mismo tiempo"
# Si elimino uno, los otros siguen
```

---

## 🔐 Diferencia Importante para Seguridad

### IMAGEN (Molde - SIEMPRE SEGURA)
```dockerfile
FROM ubuntu:latest
RUN useradd -m appuser    # Usuario normal
USER appuser              # NO root
# ← Esto está guardado seguro en la IMAGEN
```

### CONTENEDOR (Ejecución - PUEDE CAMBIAR)
```bash
# Si un atacante entra en un CONTENEDOR:
# Modifica archivos → Después desaparece
# Otros contenedores NO son afectados
# La IMAGEN sigue siendo segura
```

---

## ✅ Lo Que Aprendiste

✅ IMAGEN = Molde, plano, permanente  
✅ CONTENEDOR = Ejecución, temporal, viva  
✅ De 1 IMAGEN → Muchos CONTENEDORES  
✅ IMAGEN se guarda, CONTENEDOR puede perderse  
✅ Ambas son importantes para Docker  

---

## 🚀 Próximo: Comandos Básicos

[→ Continuar](./3_COMANDOS_BASICOS.md)

---

**⏱️ Tiempo de lectura: 10 minutos**
