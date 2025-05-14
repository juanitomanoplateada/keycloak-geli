# Usa la imagen oficial de Keycloak 26.2.0
FROM quay.io/keycloak/keycloak:26.2.0

# Copia archivos opcionales (por ejemplo, realm.json) si los necesitas
# COPY ./realm-export.json /opt/keycloak/data/import/

# Activa el modo optimizado para producción
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV JAVA_OPTS_APPEND="-XX:+UseContainerSupport"

# Si estás usando PostgreSQL como base de datos
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://db:5432/keycloak
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=keycloak

# Usuario y contraseña del administrador
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Comando de inicio
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
