FROM quay.io/keycloak/keycloak:26.2.0

# Configuración de entorno
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgres.railway.internal:5432/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

ENV KC_HOSTNAME=keycloak-geli-production.up.railway.app
ENV KC_HOSTNAME_ADMIN=keycloak-geli-production.up.railway.app
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_URL=http://0.0.0.0:8080

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV JAVA_OPTS_APPEND="-XX:+UseContainerSupport"

# Build del servidor (requerido en producción)
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
