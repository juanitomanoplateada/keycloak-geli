FROM quay.io/keycloak/keycloak:26.2.0

# 1) Base de datos PostgreSQL de Railway
ENV KC_DB=postgres \
    KC_DB_URL=jdbc:postgresql://postgres.railway.internal:5432/railway \
    KC_DB_USERNAME=postgres \
    KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk

# 2) Admin user
ENV KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=admin

# 3) Configuración para que Keycloak en dev mode lea estas vars
ENV KC_HTTP_ENABLED=true \
    KC_PROXY=edge \
    KC_HOSTNAME=https://keycloak-geli-production.up.railway.app \
    KC_HOSTNAME_STRICT=false

# 4) Arranca en modo desarrollo (más permisivo)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
