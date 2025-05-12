# Usa la imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:latest

# Copia el archivo del realm exportado al contenedor
COPY realm/realm-export.json /opt/jboss/keycloak/standalone/configuration/

# Configura el entorno
ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=adminpassword

# Exponer el puerto 8080
EXPOSE 8080

# Comando para arrancar Keycloak con el archivo de exportación
CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/standalone/configuration/realm-export.json"]
