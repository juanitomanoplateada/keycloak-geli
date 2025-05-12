FROM quay.io/keycloak/keycloak:latest

# Copiamos el archivo de exportación
COPY realm/realm-export.json /opt/keycloak/data/import/realm-export.json

# Entramos en modo producción
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=adminpassword

EXPOSE 8080

# Comando de inicio con importación
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm"]
