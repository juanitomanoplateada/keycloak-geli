FROM quay.io/keycloak/keycloak:26.2.0

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_LOG_LEVEL=INFO

# Opcional: si deseas importar un realm en el primer inicio
# COPY realm-export.json /opt/keycloak/data/import/realm-export.json

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-enabled=true", "--hostname-strict=false", "--hostname-strict-https=false"]
