# 🚀 Proyectos Finales - Docker Security Course

> **Demuestra tu dominio de Docker eligiendo un proyecto**

---

## 🎯 Objetivo

Completar UN proyecto capstone que demuestre:
✅ Conocimiento de Docker  
✅ Enfoque en seguridad  
✅ Capacidad práctica  

---

## 📋 Elige Un Proyecto

### 🎁 PROYECTO 1: Blog Seguro

**Dificultad:** Intermedia  
**Tiempo:** 3-4 horas

#### Requisitos:
```
Crear una aplicación de blog con:
✅ Contenedor de WordPress (o similar)
✅ Base de datos PostgreSQL separada
✅ Todo en Docker Compose
✅ Usuarios non-root implementados
✅ Permisos correctos (600 para secretos)
✅ Limites de recursos establecidos
✅ Health checks funcionales
✅ Documentación completa
```

#### Entregables:
- `docker-compose.yml` funcional
- 2 Dockerfiles (uno para cada servicio)
- Archivo `.env` de ejemplo (sin contraseñas reales)
- README.md con instrucciones
- Capturas de pantalla mostrando:
  - Contenedores corriendo
  - Usuario verificado como non-root
  - Blog accesible en navegador

---

### 🔗 PROYECTO 2: Microservicios

**Dificultad:** Intermedia-Avanzada  
**Tiempo:** 4-5 horas

#### Requisitos:
```
Crear una app de TODO con:
✅ API Backend (Python/Node/Go)
✅ Frontend (simple HTML/JS)
✅ Base de datos (PostgreSQL)
✅ Redis para cache
✅ Nginx como proxy reverso
✅ Todo en Docker Compose
✅ Seguridad implementada en todos los servicios
✅ Variables de environment seguros
✅ Redes aisladas entre servicios
✅ Documentación completa
```

#### Entregables:
- `docker-compose.yml` con 5+ servicios
- Dockerfiles para cada servicio
- Código de ejemplo funcional
- README.md con diagrama de arquitectura
- Instrucciones para:
  - Levantar la app
  - Añadir un TODO
  - Ver lista de TODOs
  - Detener todo correctamente

---

### 🔍 PROYECTO 3: Pipeline de Seguridad

**Dificultad:** Avanzada  
**Tiempo:** 4-5 horas

#### Requisitos:
```
Crear un pipeline que:
✅ Construya una imagen Docker
✅ Escanee vulnerabilidades (Trivy)
✅ Verifique permisos y seguridad (Hadolint)
✅ Tagee la imagen correctamente
✅ Pushee a registro (local o DockerHub)
✅ Genere reporte de seguridad
✅ Despliegue en contenedor test
✅ Verifique que todo funciona

Automatización:
- Script bash que haga todo automáticamente
- Salida clara de cada paso
- Reporte final de seguridad
```

#### Entregables:
- `Dockerfile` con app simple
- Script `build_and_test.sh` automatizado
- Reporte de seguridad (markdown)
- Instrucciones de cómo ejecutar
- Screenshots del pipeline en acción

---

### 📊 PROYECTO 4: Auditoría de Seguridad

**Dificultad:** Intermedia-Avanzada  
**Tiempo:** 3-4 horas

#### Requisitos:
```
Auditar una app existente:
✅ Clonar/descargar app open source
✅ Crear Dockerfile inseguro (como ejemplo)
✅ Identificar vulnerabilidades
✅ Crear Dockerfile seguro
✅ Documentar cada cambio
✅ Justificar decisiones de seguridad
✅ Crear comparativa antes/después
✅ Incluir recomendaciones
```

#### Entregables:
- `Dockerfile.inseguro` (original)
- `Dockerfile.seguro` (mejorado)
- Documento `AUDITORIA.md` con:
  - Problemas identificados
  - Soluciones aplicadas
  - Por qué es importante cada cambio
  - Recomendaciones adicionales
- Comparación visual (fotos, tablas)

---

## 📋 Criterios de Evaluación

### Funcionalidad (40 puntos)
- ✅ La aplicación funciona completamente
- ✅ Se puede ejecutar con un comando
- ✅ No tiene errores visibles

### Seguridad (30 puntos)
- ✅ Usuarios non-root implementados
- ✅ Permisos correctos
- ✅ Secretos protegidos
- ✅ Sin vulnerabilidades obvias
- ✅ Imágenes base apropiadas

### Documentación (20 puntos)
- ✅ README claro y completo
- ✅ Instrucciones paso a paso
- ✅ Comentarios en código
- ✅ Explicación de decisiones

### Extras (10 puntos bonus)
- ✅ Health checks implementados
- ✅ Limites de recursos
- ✅ Monitoreo/logs
- ✅ Scripts de automatización
- ✅ Seguridad extra

---

## 🚀 Cómo Empezar

### Paso 1: Elige Tu Proyecto
Decide cuál te interesa más.

### Paso 2: Planifica
Escribe en un documento:
- Objetivos
- Requisitos técnicos
- Arquitectura
- Timeline

### Paso 3: Implementa
Trabaja paso a paso:
- Crear Dockerfile(s)
- Probar localmente
- Iterar sobre seguridad
- Documentar

### Paso 4: Prueba
```bash
# Verifica que:
docker run proyecto whoami              # No root
docker ps                               # Contadores corriendo
docker logs <container>                 # Sin errores
```

### Paso 5: Entrega
Comprime todo en:
```
proyecto-final.zip
├── docker-compose.yml (o Dockerfiles)
├── README.md
├── app/ (código de ejemplo)
├── SEGURIDAD.md (explicación)
└── CAPTURAS/ (screenshots)
```

---

## ✅ Checklist Antes de Entregar

```
□ Código funciona sin errores
□ Documentación completa
□ Usuarios verificados como non-root
□ Imágenes optimizadas
□ No hay secretos en código
□ README tiene instrucciones claras
□ Incluyo evidencia (screenshots)
□ Pruebo todo localmente antes
□ Documenté decisiones de seguridad
□ Incluyo mejoras futuras sugeridas
```

---

## 💡 Consejos

### ✅ BIEN
- Empieza simple, agrega complejidad
- Testea regularmente
- Lee documentación oficial
- Pide ayuda si lo necesitas

### ❌ EVITA
- Copiar código sin entender
- Ignorar advertencias de seguridad
- Dejar secretos en código
- Hacer todo de golpe

---

<div align="center">

## 🎯 ¿Listo para tu Proyecto Final?

### Elige uno y ¡comienza!

[Proyecto 1: Blog](../LABORATORIOS/) | [Proyecto 2: Microservicios](../LABORATORIOS/) | [Proyecto 3: Pipeline](../LABORATORIOS/) | [Proyecto 4: Auditoría](../LABORATORIOS/)

---

**"El mejor aprendizaje es haciendo"** 🐳

</div>
