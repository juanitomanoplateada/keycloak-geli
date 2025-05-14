# Dockerfile para Railway – Keycloak 26.2.0
FROM quay.io/keycloak/keycloak:26.2.0

ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgres.railway.internal:5432/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV JAVA_OPTS_APPEND="-XX:+UseContainerSupport"

# Paso obligatorio para modo optimizado: construir antes de iniciar
RUN /opt/keycloak/bin/kc.sh build

# Inicio en modo optimizado
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
