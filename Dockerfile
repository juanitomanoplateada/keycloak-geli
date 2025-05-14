FROM quay.io/keycloak/keycloak:26.2.0

# Descargar manualmente el driver JDBC de PostgreSQL
ADD https://jdbc.postgresql.org/download/postgresql-42.7.3.jar /opt/keycloak/providers/

# Variables admin
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# Compilar el servidor con PostgreSQL y features requeridas
RUN /opt/keycloak/bin/kc.sh build \
  --db=postgres \
  --features=token-exchange \
  --health-enabled=true \
  --metrics-enabled=false

# Ejecutar el servidor
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
