# Usa la imagen oficial de Keycloak versión 26.2.0
FROM quay.io/keycloak/keycloak:26.2.0

# Habilita el modo de inicio sin configuración interactiva
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# Copia el realm de exportación si lo tienes
# Descomenta si tienes un archivo realm-export.json en el repo
# COPY realm-export.json /opt/keycloak/data/import/

# Comando para iniciar Keycloak en modo optimizado con importación de realm (si lo deseas)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# Argumentos por defecto, puede modificarse en Railway → Variables
CMD ["start", "--optimized", "--import-realm"]
