# Usamos la imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:latest

# Copiamos el realm a importar
COPY realm/realm-export.json /opt/keycloak/data/import/realm-export.json

# Credenciales de administrador
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=adminpassword

# Configuraciones de hostname/proxy
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge

# Exponemos el puerto por defecto
EXPOSE 8080

# Arrancamos Keycloak en modo development, importando el realm
# y usando PORT (o 8080 si no está definido)
ENTRYPOINT [ "sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --import-realm --http-port=${PORT:-8080}" ]
