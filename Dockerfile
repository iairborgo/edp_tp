FROM ubuntu:22.04
LABEL mainteiner="Avecilla, Borgo Elgart, Nardi"

RUN apt-get update && apt-get install --no-install-recommends -y 
RUN apt-get install -y imagemagick
RUN apt-get install -y wget
RUN apt-get install git -y
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY . .
RUN chmod +x menu.sh generar.sh descomprimir.sh procesar.sh comprimir.sh
CMD ["bash","/menu.sh"]
