FROM quay.io/keycloak/keycloak:26.2.0

# 1. Base de datos
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgres.railway.internal:5432/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk

# 2. Admin user
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# 3. Build para producción
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD [
  "start", 
  "--optimized",
  "--http-enabled", 
  "--hostname", "keycloak-geli-production.up.railway.app",
  "--proxy", "edge"
]
