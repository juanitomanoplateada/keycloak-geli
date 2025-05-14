FROM quay.io/keycloak/keycloak:26.2.0

# Usuario admin (configurado en tiempo de ejecución por Railway)
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# Build con argumentos en tiempo de build (no en runtime)
RUN /opt/keycloak/bin/kc.sh build \
    --db=postgres \
    --features=token-exchange \
    --health-enabled=true \
    --metrics-enabled=false

# Iniciar el servidor con las configuraciones ya persistidas en el build
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
