#!/bin/bash

echo "🚀 Iniciando restauración de Snipe-IT..."

# Paso 1: Clonar el repositorio desde GitHub
echo "🔁 Clonando proyecto desde GitHub..."
git clone https://github.com/xSxln/Snipe---Backup-.git snipeit-restaurado
cd snipeit-restaurado || exit

# Paso 2: Instalar dependencias con Composer
echo "📦 Instalando dependencias con Composer..."
composer install

# Paso 3: Copiar el archivo de entorno
echo "📝 Creando archivo .env desde ejemplo..."
cp .env.example .env

# Paso 4: Generar clave de aplicación Laravel
echo "🔑 Generando clave de aplicación Laravel..."
php artisan key:generate

# Paso 5: Restaurar base de datos
echo "🛠️ Restaurando base de datos MySQL..."
echo "💬 Por favor, ingresa tu contraseña MySQL cuando se te solicite."
mysql -u snipeit -p snipeit < snipeit_backup.sql

# Paso 6: Validar migraciones
echo "🔎 Validando migraciones..."
php artisan migrate:status

# Paso 7: Listar rutas disponibles
echo "📍 Listando rutas disponibles..."
php artisan route:list

# Paso 8: Final
echo "✅ Restauración completa. Puedes iniciar el servidor con:"
echo "   php artisan serve --port=8001"

