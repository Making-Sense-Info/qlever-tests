FROM index.docker.io/adfreiburg/qlever:latest@sha256:526b36fbdcbf0629c07060368b09d838b60759d8f50bf7eee70d496236a8d2cb

# Upgrade depdendencies and do some cleanup
USER root
RUN export SUDO_FORCE_REMOVE=yes \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get purge -y --auto-remove sudo \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean \
  && unset SUDO_FORCE_REMOVE \
  && rm -f /etc/profile.d/qlever.sh /qlever/.bashrc /qlever/docker-entrypoint.sh

# Just make sure that the user that will be running the container will have the necessary permissions
RUN mkdir -p /qlever /data \
  && chmod -R a+rw /data \
  && chmod -R a+rw /qlever
RUN echo 'eval "$(register-python-argcomplete qlever)"' >> /qlever/.bashrc
ENV QLEVER_ARGCOMPLETE_ENABLED="1"
ENV QLEVER_IS_RUNNING_IN_CONTAINER="1"

# Include some useful scripts
RUN mkdir -p /qlever/scripts
COPY ./common/generate-qleverfile.sh /qlever/scripts/
COPY ./server/entrypoint.sh /qlever/scripts/
RUN chmod +x /qlever/scripts/*.sh

# Use the nobody user by default
USER 65534

WORKDIR /qlever

EXPOSE 7001

ENTRYPOINT [ "" ]
CMD [ "/qlever/scripts/entrypoint.sh" ]
