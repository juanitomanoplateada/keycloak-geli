FROM quay.io/keycloak/keycloak:26.2.0 AS builder

ENV KC_DB=postgres
ENV KC_DB_URL_HOST=postgres.railway.internal
ENV KC_DB_URL_PORT=5432
ENV KC_DB_URL_DATABASE=railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=whslSwSWKVgWzbbimkVIByhEZOyLGjSk

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=false
ENV KC_FEATURES=token-exchange
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME=keycloak-geli-production.up.railway.app
ENV KC_PROXY_HEADERS=xforwarded

ADD --chown=keycloak:keycloak https://github.com/klausbetz/apple-identity-provider-keycloak/releases/download/1.7.1/apple-identity-provider-1.7.1.jar /opt/keycloak/providers/apple-identity-provider.jar
ADD --chown=keycloak:keycloak https://github.com/wadahiro/keycloak-discord/releases/download/v0.5.0/keycloak-discord-0.5.0.jar /opt/keycloak/providers/keycloak-discord.jar

COPY theme/keywind /opt/keycloak/themes/keywind

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.2.0

COPY java.config /etc/crypto-policies/back-ends/java.config
COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--import-realm", "--http-enabled=true", "--hostname-strict=false", "--proxy-headers=xforwarded"]
