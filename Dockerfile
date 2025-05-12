# Dockerfile
FROM quay.io/keycloak/keycloak:21.1.1

# Desactivar validación estricta de hostname (útil en entornos con host dinámico)
ENV KC_HOSTNAME_STRICT=false

# Puerto expuesto por Keycloak
EXPOSE 8080

# Arranque de Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--hostname-strict=false", "--http-port=8080"]
