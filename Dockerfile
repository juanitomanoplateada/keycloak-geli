FROM quay.io/keycloak/keycloak:26.2.0

# Instala el driver JDBC de PostgreSQL
RUN microdnf install -y postgresql-jdbc

# Establece variables del administrador
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# Compila Keycloak con los argumentos de build necesarios
RUN /opt/keycloak/bin/kc.sh build \
  --db=postgres \
  --features=token-exchange \
  --health-enabled=true \
  --metrics-enabled=false

# Comando de ejecución optimizado
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
