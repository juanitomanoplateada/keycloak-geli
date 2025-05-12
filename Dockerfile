# Dockerfile
FROM quay.io/keycloak/keycloak:21.1.1

# Directorio de trabajo
WORKDIR /opt/keycloak

# Desactivar strict hostname (útil en entornos cloud)
ENV KC_HOSTNAME_STRICT=false

# Exponer el puerto HTTP de Keycloak
EXPOSE 8080

# Arrancar en modo desarrollo (HTTP)
ENTRYPOINT ["./bin/kc.sh", "start-dev", "--http-port=8080"]
