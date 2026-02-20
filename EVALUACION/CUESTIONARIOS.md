# ❓ Cuestionarios - Docker Security Course

> **Demuestra tu conocimiento**

---

## 📝 Módulo 1: Conceptos Básicos

### Preguntas:

**1. ¿Qué es Docker?**
- a) Un programa para borrar archivos
- b) Un sistema para empacar aplicaciones en "cajas"
- c) Un editor de fotos
- d) Un navegador web

<details>
<summary>Respuesta</summary>

**b)** Un sistema para empacar aplicaciones en "cajas"

Docker permite empacar tu aplicación con todo lo necesario (código, librerías, configuraciones) en un contenedor que funciona igual en cualquier computadora.
</details>

---

**2. ¿Cuál es la diferencia entre IMAGEN y CONTENEDOR?**
- a) Son lo mismo
- b) Imagen es el molde, contenedor es el resultado ejecutando
- c) Imagen corre, contenedor no
- d) No hay diferencia, solo nombres

<details>
<summary>Respuesta</summary>

**b)** Imagen es el molde, contenedor es el resultado ejecutando

- IMAGEN: Archivo estático, plano, se reutiliza
- CONTENEDOR: La imagen en ejecución, temporal, viva
</details>

---

**3. ¿Cuántos contenedores puedes hacer de UNA imagen?**
- a) Solo uno
- b) Máximo 10
- c) Ilimitados, tantos como quieras
- d) Depende del sistema operativo

<details>
<summary>Respuesta</summary>

**c)** Ilimitados, tantos como quieras

De una misma imagen puedes crear múltiples contenedores, todos ejecutando simultáneamente.
</details>

---

**4. ¿Qué archivo describe cómo construir una imagen?**
- a) README.md
- b) Dockerfile
- c) config.json
- d) index.html

<details>
<summary>Respuesta</summary>

**b)** Dockerfile

El Dockerfile es un archivo de texto con instrucciones para construir una imagen Docker.
</details>

---

**5. ¿Qué comando descargas una imagen?**
- a) docker download
- b) docker get
- c) docker pull
- d) docker fetch

<details>
<summary>Respuesta</summary>

**c)** docker pull

Ejemplo: `docker pull ubuntu`
</details>

---

**6. ¿Qué comando crea Y ejecuta un contenedor?**
- a) docker create
- b) docker start
- c) docker run
- d) docker exec

<details>
<summary>Respuesta</summary>

**c)** docker run

Ejemplo: `docker run ubuntu bash`
</details>

---

**7. ¿Qué comando ve contenedores que están corriendo?**
- a) docker ps -a
- b) docker see
- c) docker ps
- d) docker list

<details>
<summary>Respuesta</summary>

**c)** docker ps

- `docker ps`: Solo los que corren
- `docker ps -a`: Todos (incluso parados)
</details>

---

**8. ¿Cuál es la ventaja de Docker?**
- a) Es gratis
- b) Funciona igual en cualquier lugar
- c) Solo para Linux
- d) No tiene ventajas reales

<details>
<summary>Respuesta</summary>

**b)** Funciona igual en cualquier lugar

Si una app funciona en tu PC, funciona igual en el servidor, en la nube, en el del amigo, etc.
</details>

---

**9. ¿Docker solo funciona en Linux?**
- a) Sí, solo en Linux
- b) No, también en Windows y macOS con Docker Desktop
- c) Solo en macOS
- d) Solo en servidores

<details>
<summary>Respuesta</summary>

**b)** No, también en Windows y macOS con Docker Desktop

Docker Desktop permite usar Docker en Windows y macOS ejecutando Linux dentro.
</details>

---

**10. ¿Qué comando detiene un contenedor SIN eliminarlo?**
- a) docker delete
- b) docker end
- c) docker stop
- d) docker kill

<details>
<summary>Respuesta</summary>

**c)** docker stop

`docker stop` detiene el contenedor (puede reiniciarse)
`docker rm` lo elimina (permanente)
</details>

---

## 📝 Módulo 2: Seguridad Básica

### Preguntas:

**1. ¿Qué es "root" en Linux?**
- a) La carpeta raíz del sistema
- b) El usuario normal
- c) El usuario "super poderoso" con permisos ilimitados
- d) Un tipo de archivo

<details>
<summary>Respuesta</summary>

**c)** El usuario "super poderoso" con permisos ilimitados

Root puede hacer CUALQUIER cosa en el sistema (peligroso si atacan)
</details>

---

**2. ¿Por qué es peligroso correr un contenedor como root?**
- a) Usa más memoria
- b) Es más lento
- c) Si un atacante entra, puede controlar todo
- d) No es peligroso

<details>
<summary>Respuesta</summary>

**c)** Si un atacante entra, puede controlar todo

Un atacante como root puede: borrar datos, instalar malware, comprometer el sistema.
</details>

---

**3. ¿Cuál es la forma segura de correr una app?**
- a) Como root
- b) Como usuario normal (non-root)
- c) Sin usuarios
- d) No importa

<details>
<summary>Respuesta</summary>

**b)** Como usuario normal (non-root)

Un usuario normal tiene permisos limitados, menor daño si lo hackean.
</details>

---

**4. ¿Cómo creas un usuario en Dockerfile?**
- a) USER appuser
- b) RUN useradd -m appuser
- c) CREATE USER appuser
- d) RUN adduser appuser

<details>
<summary>Respuesta</summary>

**b)** RUN useradd -m appuser

Luego cambias a ese usuario con: `USER appuser`
</details>

---

**5. ¿Qué significan las letras rwx?**
- a) read, write, xerox
- b) red, web, xml
- c) read, write, execute (leer, escribir, ejecutar)
- d) request, wait, x-ray

<details>
<summary>Respuesta</summary>

**c)** read, write, execute (leer, escribir, ejecutar)

r=leer, w=escribir, x=ejecutar
</details>

---

**6. En `-rwxr-xr-x`, ¿qué grupo tiene permisos?**
- a) Solo el usuario
- b) Usuario, grupo y otros
- c) Nadie
- d) Solo root

<details>
<summary>Respuesta</summary>

**b)** Usuario, grupo y otros

- Primera rwx (usuario): leer, escribir, ejecutar
- Segunda r-x (grupo): leer, ejecutar
- Tercera r-x (otros): leer, ejecutar
</details>

---

**7. ¿Cuál es un permiso seguro para archivos secretos?**
- a) 777 (todos pueden todo)
- b) 644 (todos pueden leer)
- c) 600 (solo dueño puede acceder)
- d) 000 (nadie)

<details>
<summary>Respuesta</summary>

**c)** 600 (solo dueño puede acceder)

Con 600, solo el propietario puede leer y escribir. Grupo y otros no pueden acceder.
</details>

---

**8. ¿Qué comando cambia el propietario de un archivo?**
- a) chmod
- b) chown
- c) changer
- d) changeowner

<details>
<summary>Respuesta</summary>

**b)** chown

- `chmod` cambia PER MISOS
- `chown` cambia PROPIETARIO
</details>

---

**9. En Dockerfile, ¿cómo copias un archivo y cambias propietario?**
- a) COPY app.py /app/
- b) COPY --chown=user app.py /app/
- c) COPY --owner app.py /app/
- d) No se puede

<details>
<summary>Respuesta</summary>

**b)** COPY --chown=user app.py /app/

Ejemplo: `COPY --chown=appuser:appuser app.py .`
</details>

---

**10. ¿Por qué verificas con `docker run imagen whoami`?**
- a) Para imprimir el usuario
- b) Para confirmar que corre como usuario normal, no root
- c) Para divertirse
- d) Para ralentizar Docker

<details>
<summary>Respuesta</summary>

**b)** Para confirmar que corre como usuario normal, no root

Si ves "appuser" → ✅ seguro
Si ves "root" → ❌ peligroso
</details>

---

## 🎯 Respuestas Correctas

### Puntuación

- **0-14 respuestas:** Repasa los módulos
- **15-18 respuestas:** Buen progreso, sigue practicando
- **19-20 respuestas:** ¡Excelente dominio!

---

## 📖 Módulos Adicionales (Para Expandir)

Los cuestionarios para Módulos 3-6 seguirán el mismo patrón:
- 10 preguntas cada uno
- Opción múltiple
- Respuestas detalladas

---

<div align="center">

## ¿Pasaste los Cuestionarios?

✅ 70%+ = Estás listo para proyectos finales  
❌ Menos = Repasa y vuelve a intentar

### [→ Proyectos Finales](./PROYECTOS_FINALES.md)

</div>
