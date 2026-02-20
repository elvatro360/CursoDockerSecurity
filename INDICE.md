# 🗂️ ÍNDICE COMPLETO - Docker Security Course

---

## 📖 INICIO RÁPIDO

### Para Principiantes
1. **[README.md](./README.md)** - Presentación del curso
2. **[PRIMEROS_PASOS.md](./PRIMEROS_PASOS.md)** - Instalar Docker
3. **[GLOSARIO.md](./GLOSARIO.md)** - Aprende términos

### Para Educadores
- [Estructura del curso](./MODULOS.md)
- [Soluciones de laboratorios](./LABORATORIOS/soluciones/)
- [Cuestionarios con respuestas](./EVALUACION/CUESTIONARIOS.md)

---

## 📚 MÓDULOS (Léelos en orden)

### [MÓDULO 1: Conceptos Básicos](./MODULO_1_CONCEPTOS/)
Tiempo: 2-3 horas | Nivel: ⭐ Principiante

- [¿Qué es Docker?](./MODULO_1_CONCEPTOS/1_QUE_ES_DOCKER.md)
- [Imágenes vs Contenedores](./MODULO_1_CONCEPTOS/2_IMAGENES_VS_CONTENEDORES.md)
- [Comandos Básicos](./MODULO_1_CONCEPTOS/3_COMANDOS_BASICOS.md)
- [Ejercicios Prácticos](./MODULO_1_CONCEPTOS/ejercicios.md)
- [Ejemplos de Dockerfiles](./MODULO_1_CONCEPTOS/ejemplos/Dockerfiles.md)

**Qué Aprenderás:**
✅ Qué es Docker y por qué lo necesitas  
✅ Diferencia entre imágenes y contenedores  
✅ Comandos esenciales  
✅ Tu primer contenedor funcional  

---

### [MÓDULO 2: Seguridad Básica](./MODULO_2_SEGURIDAD_BASICA/)
Tiempo: 2-3 horas | Nivel: ⭐ Principiante

- [Usuarios Non-Root](./MODULO_2_SEGURIDAD_BASICA/1_USUARIOS_NO_ROOT.md)
- [Permisos Seguros](./MODULO_2_SEGURIDAD_BASICA/2_PERMISOS.md)
- [Ejercicios Prácticos] *(En desarrollo)*

**Qué Aprenderás:**
✅ Por qué non-root es importante  
✅ Cómo crear usuarios seguros  
✅ Entender permisos (rwx)  
✅ Proteger archivos sensibles  

---

### MÓDULO 3: Imágenes Seguras
Tiempo: 2-3 horas | Nivel: ⭐⭐ Intermedio

*(Estructura lista, contenido en desarrollo)*

**Temas:**
- Best practices para Dockerfiles
- Multi-stage builds
- Escaneo de vulnerabilidades

---

### MÓDULO 4: Contenedores Seguros
Tiempo: 3-4 horas | Nivel: ⭐⭐ Intermedio

*(Estructura lista, contenido en desarrollo)*

**Temas:**
- Límites de recursos
- Redes seguras
- Volúmenes y datos

---

### MÓDULO 5: Docker Compose
Tiempo: 3-4 horas | Nivel: ⭐⭐ Intermedio

*(Estructura lista, contenido en desarrollo)*

**Temas:**
- Múltiples contenedores
- Servicios conectados
- Secrets y variables

---

### MÓDULO 6: Seguridad Avanzada
Tiempo: 4-5 horas | Nivel: ⭐⭐⭐ Avanzado

*(Estructura lista, contenido en desarrollo)*

**Temas:**
- Volúmenes de secretos
- Registros privados
- Vulnerabilidades conocidas

---

## 🧪 LABORATORIOS

### [Página Principal de Labs](./LABORATORIOS/)

#### [LAB 1: Tu Primer Contenedor](./LABORATORIOS/LAB_1_primer_contenedor.md)
**Nivel:** Principiante | **Tiempo:** 30-45 minutos

Crea, ejecuta y controla tu primer contenedor.

#### [LAB 2: Dockerfile Seguro](./LABORATORIOS/LAB_2_dockerfile_seguro.md)
**Nivel:** Principiante | **Tiempo:** 1 hora

Escribe un Dockerfile seguro desde cero.

#### [LAB 3: WordPress Docker](./LABORATORIOS/LAB_3_wordpress_docker.md)
**Nivel:** Intermedio | **Tiempo:** 1.5 horas

WordPress + Base de datos con seguridad.

#### [LAB 4: Microservicios](./LABORATORIOS/LAB_4_microservicios.md)
**Nivel:** Intermedio | **Tiempo:** 2 horas

Múltiples servicios comunicándose.

#### [LAB 5: Auditoría de Seguridad](./LABORATORIOS/LAB_5_auditoria_seguridad.md)
**Nivel:** Avanzado | **Tiempo:** 2 horas

Encontrar y arreglar vulnerabilidades.

---

## 📚 RECURSOS

### [Página de Recursos](./RECURSOS/README.md)

- **Comandos Docker** - Referencia rápida
- **Herramientas de Seguridad** - Trivy, Hadolint, Scout
- **Troubleshooting** - Solución de problemas comunes
- **Enlaces Útiles** - Documentación oficial

---

## 🎓 EVALUACIÓN

### [Página de Evaluación](./EVALUACION/)

#### [Cuestionarios](./EVALUACION/CUESTIONARIOS.md)
- **Módulo 1:** 10 preguntas
- **Módulo 2:** 10 preguntas
- Total: 20 preguntas con respuestas

**Aprobación:** 70% o más

#### [Proyectos Finales](./EVALUACION/PROYECTOS_FINALES.md)
Elige UNO:
1. **Blog Seguro** - WordPress en Docker
2. **Microservicios** - App con múltiples servicios
3. **Pipeline de Seguridad** - Automatizar construcción
4. **Auditoría** - Mejorar app existente

#### [Certificado](./EVALUACION/CERTIFICADO.md)
Obtén tu certificado completando:
- ✅ Módulos 1-2 (mínimo)
- ✅ Laboratorios 3+ 
- ✅ Cuestionarios 70%+
- ✅ Proyecto Final

---

## 🔍 DOCUMENTOS ESPECIALES

- **[PLAN_IMPLEMENTADO.md](./PLAN_IMPLEMENTADO.md)** - Detalles del proyecto
- **[STATUS.md](./STATUS.md)** - Estado actual
- **[PROYECTO_COMPLETADO.md](./PROYECTO_COMPLETADO.md)** - Logros alcanzados
- **[RESUMEN_FINAL.md](./RESUMEN_FINAL.md)** - Estadísticas finales

---

## 🗺️ RUTA DE APRENDIZAJE RECOMENDADA

### Semana 1: Fundamentos
```
Lunes   → README + PRIMEROS_PASOS
Martes  → GLOSARIO
Miércoles → MODULO 1 (lecciones 1-2)
Jueves  → MODULO 1 (lección 3 + ejercicios)
Viernes → LAB 1: Primer Contenedor
```

### Semana 2: Seguridad Básica
```
Lunes   → MODULO 2 (lección 1: Non-root)
Martes  → MODULO 2 (lección 2: Permisos)
Miércoles → Ejercicios MODULO 2
Jueves  → LAB 2: Dockerfile Seguro
Viernes → Repaso + dudas
```

### Semana 3-4: Módulos 3-6 + Labs
```
(Estructura lista para continuar)
```

---

## 💬 CÓMO USAR ESTE ÍNDICE

### Si Eres Estudiante
1. Empieza por [PRIMEROS_PASOS.md](./PRIMEROS_PASOS.md)
2. Estudia [MÓDULO 1](./MODULO_1_CONCEPTOS/) completamente
3. Sigue a [MÓDULO 2](./MODULO_2_SEGURIDAD_BASICA/)
4. Haz [LAB 1](./LABORATORIOS/LAB_1_primer_contenedor.md) y [LAB 2](./LABORATORIOS/LAB_2_dockerfile_seguro.md)
5. Responde [Cuestionarios](./EVALUACION/CUESTIONARIOS.md)
6. Completa [Proyecto Final](./EVALUACION/PROYECTOS_FINALES.md)
7. Obtén [Certificado](./EVALUACION/CERTIFICADO.md)

### Si Eres Educador
1. Revisa [Estructura](./MODULOS.md)
2. Enseña [MÓDULO 1](./MODULO_1_CONCEPTOS/)
3. Asigna [LAB 1](./LABORATORIOS/LAB_1_primer_contenedor.md)
4. Usa [Cuestionarios](./EVALUACION/CUESTIONARIOS.md) para evaluar
5. Ten [Soluciones](./LABORATORIOS/soluciones/) disponibles

### Si Eres Contribuidor
1. Revisa [RESUMEN_FINAL.md](./RESUMEN_FINAL.md)
2. Elige un módulo o lab incompleto
3. Sigue el mismo estilo que existe
4. Prueba localmente con Docker
5. Envía pull request

---

## 🔗 NAVEGACIÓN RÁPIDA

```
📍 Estoy aquí: INDICE.md

🚀 Quiero empezar:
   → PRIMEROS_PASOS.md

📖 Necesito aprender:
   → GLOSARIO.md

🏫 Quiero estudiar:
   → MODULO_1_CONCEPTOS/

🧪 Quiero practicar:
   → LABORATORIOS/

❓ Tengo un problema:
   → RECURSOS/

📊 Quiero evaluar:
   → EVALUACION/
```

---

## 📊 ESTADÍSTICAS DEL CURSO

```
Total de Archivos: 25+
Total de Palabras: 30,000+
Módulos: 6 (2 completos)
Laboratorios: 5 (2 completos)
Ejercicios: 50+
Cuestionarios: 20
Proyectos: 4
Horas de Contenido: 50+ horas

Estado de Finalización:
Fase 1 (Fundación): 100% ✅
Fase 2 (Módulo 1-2): 80% ✅
Fase 3 (Módulo 3-6): 20% (Estructura lista)
Fase 4 (Laboratorios): 40% (2 de 5)
Fase 5 (Evaluación): 100% ✅
```

---

## 🎯 OBJETIVOS POR COMPLETAR

```
✅ = Completado
🔄 = En Progreso
⏳ = Pendiente

Fundación:
✅ README principal
✅ PRIMEROS_PASOS
✅ GLOSARIO
✅ MODULOS

MODULO 1:
✅ Lección 1: ¿Qué es Docker?
✅ Lección 2: Imágenes vs Contenedores
✅ Lección 3: Comandos Básicos
✅ Ejercicios completos
✅ Ejemplos Dockerfiles

MODULO 2:
✅ Lección 1: Usuarios Non-Root
✅ Lección 2: Permisos
⏳ Lección 3: Redes Seguras
⏳ Ejercicios

MODULO 3-6:
⏳ Estructura lista
⏳ Contenido a crear

LABORATORIOS:
✅ LAB 1: Primer Contenedor
✅ LAB 2: Dockerfile Seguro
⏳ LAB 3: WordPress
⏳ LAB 4: Microservicios
⏳ LAB 5: Auditoría

EVALUACIÓN:
✅ Cuestionarios (20 pregs)
✅ Proyectos Finales (4 opciones)
✅ Sistema de Certificación

RECURSOS:
✅ Guía de herramientas
✅ Troubleshooting
⏳ Guías avanzadas
```

---

<div align="center">

## 📚 BIENVENIDO AL CURSO

### Elige tu camino:

[👶 Soy Principiante](./PRIMEROS_PASOS.md) | [🎓 Soy Educador](./MODULOS.md) | [🤝 Quiero Contribuir](./PLAN_IMPLEMENTADO.md)

---

**"El conocimiento es el primer paso hacia Docker maestría" 🐳**

### [← Volver al README](./README.md)

</div>
