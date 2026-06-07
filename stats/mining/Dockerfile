FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl zip unzip git ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -s "https://get.sdkman.io" | bash

RUN bash -c "\
  source /root/.sdkman/bin/sdkman-init.sh && \
  sdk install java 8.0.492-tem && \
  sdk install java 11.0.31-tem && \
  sdk install java 17.0.19-tem && \
  sdk install java 21.0.11-tem && \
  sdk install java 25.0.3-tem && \
  sdk install ant && \
  sdk install maven \
"

ENV SDKMAN_DIR=/root/.sdkman
ENV JAVA_HOME=/root/.sdkman/candidates/java/current

ENV PATH="${JAVA_HOME}/bin:\
/root/.sdkman/candidates/ant/current/bin:\
/root/.sdkman/candidates/maven/current/bin:\
${PATH}"

WORKDIR /mining

COPY . .

WORKDIR /mining/scripts

RUN chmod +x run.sh

CMD ["./run.sh"]
