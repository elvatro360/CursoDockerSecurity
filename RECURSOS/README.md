# 📚 Recursos - Docker Security Course

> **Guías, herramientas y referencias**

---

## 🛠️ Comandos Docker Rápidos

### Imágenes
```bash
docker images                 # Ver imágenes
docker pull ubuntu            # Descargar imagen
docker search ubuntu          # Buscar imagen
docker rmi nombre             # Eliminar imagen
docker image prune            # Limpiar imágenes sin usar
```

### Contenedores
```bash
docker ps                     # Contenedores activos
docker ps -a                  # Todos los contenedores
docker run ubuntu             # Crear y ejecutar
docker stop nombre            # Detener
docker start nombre           # Reiniciar
docker rm nombre              # Eliminar
docker logs nombre            # Ver logs
docker exec -it nombre bash   # Entrar en contenedor activo
```

### Docker Compose
```bash
docker-compose up             # Iniciar servicios
docker-compose up -d          # En segundo plano
docker-compose down           # Detener servicios
docker-compose logs           # Ver logs
docker-compose ps             # Ver estado
```

### Limpieza
```bash
docker system prune           # Limpiar todo (no en uso)
docker volume prune           # Limpiar volúmenes
docker network prune          # Limpiar redes
```

---

## 🔍 Herramientas de Seguridad

### Trivy - Scanner de Vulnerabilidades
```bash
# Instalar
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

# Usar
trivy image nombre-imagen
trivy fs /ruta/carpeta
```

### Hadolint - Linter de Dockerfile
```bash
# Instalar
brew install hadolint  # macOS
apt-get install hadolint  # Linux

# Usar
hadolint Dockerfile
```

### Docker Scout - Análisis de Imágenes
```bash
docker scout cves nombre-imagen
docker scout compare base-image nueva-image
```

---

## 📖 Enlaces Útiles

### Documentación Oficial
- [Docker Official Docs](https://docs.docker.com/)
- [Docker Security Best Practices](https://docs.docker.com/develop/security-best-practices/)
- [Docker Compose Reference](https://docs.docker.com/compose/compose-file/)

### Seguridad
- [OWASP Container Security](https://owasp.org/www-project-secure-coding-practices-quick-reference-guide/)
- [CIS Docker Benchmark](https://www.cisecurity.org/benchmark/docker)
- [Docker Bench Security](https://github.com/docker/docker-bench-security)

### Comunidad
- [Docker Hub](https://hub.docker.com/) - Repositorio de imágenes
- [Docker Community](https://www.docker.com/community)
- [Stack Overflow - Docker](https://stackoverflow.com/questions/tagged/docker)

---

## ❓ Troubleshooting Común

### "docker: command not found"
```bash
# Solución 1: Reinicia Docker Desktop
# Solución 2: Verifica instalación
docker --version
```

### "permission denied: /var/run/docker.sock"
```bash
# Linux:
sudo usermod -aG docker $USER
# Luego cierra sesión y vuelve a iniciar
```

### "Cannot connect to Docker daemon"
```bash
# Windows/macOS: Abre Docker Desktop
# Linux:
sudo systemctl start docker
```

### "Image not found locally"
```bash
# Docker intentará descargar automáticamente
# O descarga manualmente:
docker pull nombre-imagen
```

### Contenedor usa mucha memoria
```bash
# Limita la memoria:
docker run --memory="512m" nombre-imagen

# O en docker-compose.yml:
services:
  app:
    image: mi-app
    mem_limit: 512m
```

---

## 📊 Estadísticas y Monitoreo

### Ver uso de recursos
```bash
docker stats                  # En tiempo real
docker stats --no-stream      # Una captura
```

### Ver eventos
```bash
docker events                 # Ver eventos en vivo
docker events --since 1h      # Últimas 1 hora
```

### Inspeccionar contenedor
```bash
docker inspect nombre         # Información completa
docker inspect nombre | grep -A 10 NetworkSettings
```

---

## 🎓 Resumen de Mejores Prácticas

✅ **DO (Haz esto)**
- Usa imágenes base oficiales
- Ejecuta como usuario non-root
- Mantén imágenes pequeñas
- Usa health checks
- Establece límites de recursos
- Escanea vulnerabilidades

❌ **DON'T (No hagas esto)**
- No corras como root
- No guardesthes en imágenes
- No uses imágenes enormes
- No ignores warnings de seguridad
- No expongas puertos innecesarios
- No actualices paquetes cada línea (agrupa comandos)

---

## 🔐 Seguridad por Defecto

```dockerfile
# ❌ INSEGURO
FROM ubuntu:latest
RUN apt-get install -y my-app
CMD ["my-app"]

# ✅ SEGURO
FROM ubuntu:latest AS builder
RUN apt-get update && apt-get install -y my-app \
    && rm -rf /var/lib/apt/lists/*

FROM ubuntu:latest
COPY --from=builder /app /app
RUN useradd -m appuser
USER appuser
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
    CMD ps aux | grep my-app || exit 1
CMD ["my-app"]
```

---

## 📞 Contacto y Soporte

### Dudas sobre el Curso
- Consulta el GLOSARIO.md
- Lee PRIMEROS_PASOS.md
- Revisa los ejemplos en cada módulo

### Errores en Docker
- Revisa esta sección de Troubleshooting
- Busca en [Docker Issues](https://github.com/moby/moby/issues)
- Pregunta en [Stack Overflow](https://stackoverflow.com/questions/tagged/docker)

---

<div align="center">

**¿Necesitas ayuda? Este es tu lugar.** 📚

</div>
