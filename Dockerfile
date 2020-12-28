FROM openliberty/open-liberty:kernel-java8-openj9-ubi

ARG VERSION=1.1
ARG REVISION=SNAPSHOT

LABEL \
  org.opencontainers.image.authors="Naveen Sisupalan" \
  org.opencontainers.image.vendor="Open Liberty" \
  org.opencontainers.image.url="local" \
  org.opencontainers.image.source="https://github.com/naveensisupalan/ol-research.git" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$REVISION" \
  vendor="Open Liberty" \
  name="rest" \
  version="$VERSION-$REVISION" \
  summary="The system rest microservice from the Deploying microservices to OpenShift guide" \
  description="This image contains the rest microservice running with the Open Liberty runtime."

COPY --chown=1001:0 src/main/liberty/config /config/
COPY --chown=1001:0 target/rest.war /config/apps

RUN configure.sh