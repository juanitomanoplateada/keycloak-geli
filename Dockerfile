# 1. Base oficial de Keycloak
FROM quay.io/keycloak/keycloak:latest

# 2. Importamos tu realm
COPY realm/realm-export.json /opt/keycloak/data/import/realm-export.json

# 3. Credenciales de administrador
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=adminpassword

# 4. Deshabilitamos hostname strict y configuramos proxy edge
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge

# 5. Exponemos el puerto por defecto
EXPOSE 8080

# 6. Arrancamos en modo dev, importando el realm y usando PORT (o 8080 si no existe)
ENTRYPOINT [ "sh", "-c", \
  "/opt/keycloak/bin/kc.sh start-dev \
    --import-realm \
    --http-port=${PORT:-8080}" ]

