@echo off
REM Script para crear la estructura del curso Docker Security

cd C:\Users\wp_fer\Development\docker-seguridad-curso

echo Creando estructura de directorios...

mkdir MODULO_1_CONCEPTOS\ejemplos\app_simple 2>nul
mkdir MODULO_2_SEGURIDAD_BASICA\ejemplos 2>nul
mkdir MODULO_3_IMAGENES_SEGURAS\ejemplos 2>nul
mkdir MODULO_4_CONTAINERS_SEGUROS\ejemplos\app-segura 2>nul
mkdir MODULO_5_DOCKER_COMPOSE\ejemplos\wordpress-seguro 2>nul
mkdir MODULO_5_DOCKER_COMPOSE\ejemplos\api-base-datos 2>nul
mkdir MODULO_5_DOCKER_COMPOSE\ejemplos\microservicios 2>nul
mkdir MODULO_6_SEGURIDAD_AVANZADA\ejemplos\registro-privado-setup 2>nul
mkdir LABORATORIOS\soluciones 2>nul
mkdir RECURSOS 2>nul
mkdir EVALUACION 2>nul

echo.
echo ✅ Estructura creada correctamente!
echo.
echo Directorios creados:
dir /s /ad

pause
