FROM ubuntu:22.04

LABEL maintainer="Avecilla, Borgo Elgart, Nardi"

# Actualizar lista de paquetes e instalar herramientas necesarias
RUN apt-get update \
    && apt-get install -y \
        imagemagick \
        wget \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configurar directorio de trabajo y copiar scripts
WORKDIR /app
COPY menu.sh generar.sh descomprimir.sh procesar.sh comprimir.sh ./

# Dar permisos de ejecución a los scripts
RUN chmod +x menu.sh generar.sh descomprimir.sh procesar.sh comprimir.sh

# Definir un volumen o directorio de enlace
VOLUME /app/output

# Comando por defecto al iniciar el contenedor
CMD ["bash", "/app/menu.sh"]
