FROM quay.io/keycloak/keycloak:26.2.0

# ❗ Variables necesarias para build-time
ENV KC_DB=postgres
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk
ENV KC_DB_URL_HOST=postgres.railway.internal
ENV KC_DB_URL_PORT=5432
ENV KC_DB_URL_DATABASE=railway

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_LOG_LEVEL=INFO

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

# ❗ NO USES --proxy → no es válido en Keycloak 26
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-enabled=true", "--hostname-strict=false", "--optimized"]
