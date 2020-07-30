from informaticslab/panzure-shared-env-notebook:0.0.25

USER root
RUN apt-get update

RUN apt-get install r-base  gdebi-core  libgdal-dev libproj-dev -y

RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1056-amd64.deb
# RUN gdebi --non-interactive "gdebi.out" rstudio-server-1.3.1056-amd64.deb 
RUN gdebi --non-interactive -o APT::Install-Recommends=0 -o APT::Install-Suggests=0 rstudio-server-1.3.1056-amd64.deb 


COPY start_rstudio_server.sh /usr/bin/start_rstudio_server.sh 
RUN chmod +x /usr/bin/start_rstudio_server.sh

COPY runner.sh /usr/bin/runner.sh
RUN chmod +x /usr/bin/runner.sh

COPY install-r-kernel.sh /usr/bin/install-r-kernel.sh
RUN chmod +x /usr/bin/install-r-kernel.sh

COPY rsession.sh /usr/bin/rsession.sh
RUN chmod +x /usr/bin/rsession.sh

RUN /usr/bin/install-r-kernel.sh
RUN echo "env installed"

ENTRYPOINT [ "/usr/bin/runner.sh" ]