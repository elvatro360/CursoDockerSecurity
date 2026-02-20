# 🔓 Permisos - Módulo 2, Parte 2

> **Entiende rwx (leer, escribir, ejecutar)**

---

## 🎯 Objetivo

Entender cómo funcionan los permisos en Linux y Docker.

---

## 📋 Notación de Permisos

En Linux, cada archivo tiene permisos así:

```
-rwxr-xr-x
│││└──┴──┴── Otros (otros usuarios)
│││──┴──────── Grupo (group)
│├┴──────────── Propietario (user/owner)
└──────────────── Tipo: - (archivo) o d (directorio)
```

### Significado

- `r` = Read (Leer)
- `w` = Write (Escribir)
- `x` = Execute (Ejecutar)
- `-` = No permission (Sin permiso)

---

## 📊 Ejemplo Completo

```
-rwxr-xr-x  user group  1234  Jan 1 12:00  app.py
│││         │    │      │
│││         │    │      └─ Tamaño
│││         │    └────────── Grupo propietario
│││         └─────────────── Usuario propietario
│└┬┴────────────────────────── r=sí, w=sí, x=sí (usuario)
└───────────────────────────── Archivo regular

TRADUCCIÓN:
- Usuario (user): puede leer (r), escribir (w), ejecutar (x)
- Grupo (group): puede leer (r), ejecutar (x)
- Otros (others): puede leer (r), ejecutar (x)
```

---

## 🎯 Permisos en Docker

### El Problema

Si creas archivos en un contenedor como `root`:

```dockerfile
FROM ubuntu
RUN echo "contraseña123" > /app/secret.txt
# Este archivo es propiedad de root, con permisos 600
```

Cuando tu app (que corre como usuario normal) quiera leerlo:

```bash
appuser$ cat /app/secret.txt
# ¡PERMISO DENEGADO!
```

### La Solución

#### Opción 1: Cambiar Propietario

```dockerfile
FROM ubuntu
RUN echo "contraseña123" > /app/secret.txt
RUN chown appuser:appuser /app/secret.txt
RUN chmod 600 /app/secret.txt  # Solo el propietario puede leer

RUN useradd -m appuser
USER appuser

CMD ["cat", "/app/secret.txt"]  # ← Ahora funciona
```

#### Opción 2: Mejor aún - COPY con chown

```dockerfile
FROM ubuntu
RUN useradd -m appuser

# Copia el archivo Y cambia propietario
COPY --chown=appuser:appuser config.txt /app/

USER appuser
CMD ["cat", "/app/config.txt"]
```

---

## 🔐 Permisos para Seguridad

### Archivos Sensibles

```
-rw-------  (600)
└─ Solo el propietario puede leer/escribir
   Grupo: nada
   Otros: nada
```

```dockerfile
# Contraseña: solo propietario la lee
RUN chmod 600 /app/password.txt

# Script ejecutable: propietario + grupo pueden ejecutar
RUN chmod 750 /app/script.sh

# Archivo público: todos pueden leer
RUN chmod 644 /app/README.md
```

---

## 📊 Permisos Comunes

| Permiso | Números | Significado | Uso |
|---------|---------|-------------|-----|
| `rwx------` | 700 | Solo dueño | Archivos privados |
| `rw-------` | 600 | Solo dueño | Secretos, contraseñas |
| `rwxr-xr-x` | 755 | Todos leen/ejecutan | Scripts |
| `rw-r--r--` | 644 | Todos leen | Documentos |
| `rwx--x--x` | 711 | Dueño controla | Directorios especiales |

---

## 🛠️ Comandos Importantes

### `chmod` - Cambiar Permisos

```bash
chmod 755 script.sh     # 755
chmod 600 secret.txt    # 600
chmod +x app            # Hacer ejecutable
chmod -x app            # Quitar ejecución
chmod go-rwx file       # Quitar permisos a grupo y otros
```

### `chown` - Cambiar Propietario

```bash
chown appuser file.txt          # Cambiar usuario
chown appuser:appuser file.txt  # Cambiar usuario y grupo
chown -R appuser:appuser /app   # Recursivo (carpeta completa)
```

### `ls -l` - Ver Permisos

```bash
ls -l
# -rw-r--r--  1 user group  1234 Jan 1 12:00 file.txt
# drwxr-xr-x  2 user group  4096 Jan 1 12:00 folder
```

---

## 🎓 En Docker

### ✅ BIEN

```dockerfile
FROM ubuntu

RUN useradd -m appuser
WORKDIR /app

# Copiar archivos CON cambio de propietario
COPY --chown=appuser:appuser ./src .

# Cambiar permisos adecuados
RUN chmod 755 entrypoint.sh
RUN chmod 600 config.txt

USER appuser
CMD ["./entrypoint.sh"]
```

### ❌ MAL

```dockerfile
FROM ubuntu

# Root copia archivos
COPY ./src /app

# Archivos son propiedad de root
# Permisos por defecto

# App no puede acceder
USER appuser
CMD ["./entrypoint.sh"]  # ← Error de permisos!
```

---

## 🎯 Ejercicio

### Crea un Dockerfile Seguro

```dockerfile
FROM ubuntu:latest

# Instalar
RUN apt-get update && apt-get install -y python3

# Crear usuario
RUN useradd -m appuser

# Copiar código CON cambio de propietario
COPY --chown=appuser:appuser app.py /app/
COPY --chown=appuser:appuser config.txt /app/

# Permisos apropiados
RUN chmod 755 /app
RUN chmod 755 /app/app.py
RUN chmod 600 /app/config.txt  # Solo la app puede leer

# Cambiar usuario
USER appuser

WORKDIR /app
CMD ["python3", "app.py"]
```

### Verificar

```bash
docker build -t secure-app .
docker run secure-app ls -l /app

# Deberías ver:
# -rwxr-xr-x  appuser  appuser  app.py
# -rw-------  appuser  appuser  config.txt
```

---

## ✅ Lo Que Aprendiste

✅ Qué son r, w, x (leer, escribir, ejecutar)  
✅ Cómo leer permisos (rwxr-xr-x)  
✅ Números de permisos (755, 600, etc.)  
✅ Cómo usar COPY con chown  
✅ Cómo asignar permisos seguros  

---

## 🚀 Próximo: Redes Seguras

[→ Continuar](./3_REDES_SEGURAS.md)

---

**⏱️ Tiempo de lectura: 10 minutos**
