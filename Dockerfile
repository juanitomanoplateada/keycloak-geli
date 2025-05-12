FROM quay.io/keycloak/keycloak:latest

COPY realm/realm-export.json /opt/keycloak/data/import/realm-export.json

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=adminpassword
ENV KC_HTTP_PORT=${PORT}
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge

EXPOSE ${PORT}

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm"]
