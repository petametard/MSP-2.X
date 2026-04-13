#!/bin/bash

# Script para mantener playit corriendo continuamente

log_file="/workspaces/MSP-2.X/playit_daemon.log"

echo "[$(date)] Iniciando playit daemon..." >> "$log_file"

# Hacer la carpeta de datos de playit si no existe
mkdir -p ~/.local/share/playit

# Ejecutar playit en loop para mantenerlo activo
while true; do
    echo "[$(date)] Iniciando proceso de playit..." >> "$log_file"
    timeout 3600 /opt/playit/agent >> "$log_file" 2>&1
    exit_code=$?
    echo "[$(date)] Playit finalizado con código: $exit_code" >> "$log_file"
    sleep 5
done
