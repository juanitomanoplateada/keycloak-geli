FROM quay.io/keycloak/keycloak:26.2.0

# Variables de entorno necesarias (Railway las inyecta en tiempo de ejecución)
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# Copiar opcionalmente el realm de exportación si lo tienes
# COPY realm-export.json /opt/keycloak/data/import/

# Construir la imagen en tiempo de build para producción (build antes de start)
RUN /opt/keycloak/bin/kc.sh build

# Ejecutar Keycloak optimizado
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
