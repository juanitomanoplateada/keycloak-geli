FROM quay.io/keycloak/keycloak:26.2.0

# 1) Conexión a la base de datos
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgres.railway.internal:5432/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk

# 2) Usuario administrador
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# 3) Modo HTTP interno y proxy de Railway
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# 4) Hostname (¡ambos como URL!)
ENV KC_HOSTNAME=https://keycloak-geli-production.up.railway.app
ENV KC_HOSTNAME_ADMIN=https://keycloak-geli-production.up.railway.app
ENV KC_HOSTNAME_STRICT=false

# 5) Health & metrics (opcionales)
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# 6) Optimización de JVM en contenedor
ENV JAVA_OPTS_APPEND="-XX:+UseContainerSupport"

# 7) Build previo a start --optimized
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
