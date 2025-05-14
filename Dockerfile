FROM quay.io/keycloak/keycloak:26.2.0

# Variables de entorno (Railway las inyecta en tiempo de ejecución)
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# (Opcional) Importar realm si tienes realm-export.json
# COPY realm-export.json /opt/keycloak/data/import/

# Construcción obligatoria antes de usar --optimized
RUN /opt/keycloak/bin/kc.sh build

# Comando de arranque
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
