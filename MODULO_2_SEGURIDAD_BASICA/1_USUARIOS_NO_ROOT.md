# 🔐 Usuarios Non-Root - Módulo 2, Parte 1

> **¿Por qué NO correr como administrador en Docker?**

---

## 🎯 La Pregunta

**¿Cuál es la diferencia entre correr un contenedor como "root" vs como "usuario normal"?**

Imagina una casa:
- **root** = El dueño de la casa (puede hacer CUALQUIER cosa)
- **usuario normal** = Un visitante (puede hacer cosas limitadas)

Si un **ladrón** entra:
- A través del **dueño** → Puede robar TODA la casa
- A través del **visitante** → Solo puede acceder a la sala de visitas

---

## 🚫 El Problema: Root

### ¿Qué es Root?

**root** es el usuario "super poderoso" en Linux.

```bash
root@contenedor:~# whoami
root

root@contenedor:~# rm -rf /    # ← ¡PUEDE BORRAR TODO!
root@contenedor:~# chmod 777 * # ← ¡PUEDE CAMBIAR PERMISOS!
root@contenedor:~# kill -9 -1  # ← ¡PUEDE MATAR PROCESOS!
```

### ❌ Por Qué es Peligroso

Si un atacante consigue entrar en tu contenedor como **root**:

```
✅ Puede: Leer archivos sensibles
✅ Puede: Modificar código
✅ Puede: Borrar todo
✅ Puede: Instalar malware
✅ Puede: Convertir tu servidor en un robot zombie

¡¡¡ ES UN DESASTRE !!!
```

---

## ✅ La Solución: Usuario Normal

### Crear un Usuario Normal

En un Dockerfile:

```dockerfile
FROM ubuntu:latest

# Crear usuario normal
RUN useradd -m -s /bin/bash appuser

# Cambiar a ese usuario
USER appuser

# Ahora todo corre como appuser, NO root
CMD ["python3", "/app/app.py"]
```

### ¿Qué puede hacer un usuario normal?

```bash
appuser@contenedor:~$ whoami
appuser

appuser@contenedor:~$ rm -rf /      # ← NO PUEDE
appuser@contenedor:~$ chmod 777 *  # ← NO PUEDE
appuser@contenedor:~$ kill -9 -1   # ← NO PUEDE
appuser@contenedor:~$ read /etc/shadow  # ← NO PUEDE
```

**Mejor, ¿verdad?**

---

## 🎯 Comparación

| Acción | root | appuser |
|--------|------|---------|
| Leer archivos públicos | ✅ | ✅ |
| Leer archivos privados | ✅ | ❌ |
| Borrar archivos del sistema | ✅ | ❌ |
| Modificar código | ✅ | ✅ (su código) |
| Instalar paquetes | ✅ | ❌ |
| Escribir en /etc | ✅ | ❌ |
| Escribir en /home/appuser | ✅ | ✅ |

---

## 🔨 Cómo Implementar Non-Root

### Paso 1: Crear Usuario en Dockerfile

```dockerfile
FROM ubuntu:latest

# Instalar aplicación como root
RUN apt-get update && apt-get install -y python3

# ← AQUÍ TERMINAMOS DE SER ROOT

# Crear usuario normal
RUN useradd -m -s /bin/bash appuser

# Cambiar a ese usuario
USER appuser

# Ahora todo es como appuser
WORKDIR /home/appuser
COPY --chown=appuser:appuser app.py .

CMD ["python3", "app.py"]
```

### Paso 2: Verificar

```bash
docker build -t mi-app .
docker run mi-app whoami
# Debería imprimir: appuser
```

---

## 💡 Casos Especiales

### Si tu app necesita root

A veces necesitas root para algunas cosas (instalar paquetes, abrir puertos bajos, etc.).

**Solución: Usa Multi-Stage Build**

```dockerfile
# ETAPA 1: Preparación (como root)
FROM ubuntu:latest AS builder
RUN apt-get update && apt-get install -y python3
RUN apt-get install -y libpq-dev
# ... todas las instalaciones como root

# ETAPA 2: Ejecución (como usuario normal)
FROM ubuntu:latest
COPY --from=builder /usr /usr

RUN useradd -m appuser
USER appuser

COPY app.py .
CMD ["python3", "app.py"]
```

---

## 🎓 Mejores Prácticas

### ✅ SIEMPRE:
- [ ] Crea un usuario normal para tu app
- [ ] Cambia a ese usuario con `USER`
- [ ] Verifica con `docker run mi-app whoami`

### ❌ NUNCA:
- [ ] Corra contenedores como root
- [ ] Ignore advertencias de seguridad
- [ ] Deje la app con permisos ilimitados

---

## 🚀 Ejercicio Rápido

### Crea dos Dockerfiles

#### inseguro.Dockerfile (❌)
```dockerfile
FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3
COPY app.py .
# ← Sin USER, corre como root
CMD ["python3", "app.py"]
```

#### seguro.Dockerfile (✅)
```dockerfile
FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3
RUN useradd -m appuser
USER appuser
COPY app.py .
CMD ["python3", "app.py"]
```

### Prueba Ambos

```bash
# Inseguro
docker build -f inseguro.Dockerfile -t inseguro .
docker run inseguro whoami
# Imprime: root ← ¡MALO!

# Seguro
docker build -f seguro.Dockerfile -t seguro .
docker run seguro whoami
# Imprime: appuser ← ¡BIEN!
```

---

## ✅ Lo Que Aprendiste

✅ root es peligroso en Docker  
✅ Usuarios normales son más seguros  
✅ Cómo crear usuarios con `useradd`  
✅ Cómo cambiar de usuario con `USER`  
✅ Por qué es importante para seguridad  

---

## 🚀 Próximo: Permisos

[→ Continuar](./2_PERMISOS.md)

---

**⏱️ Tiempo de lectura: 10 minutos**
