FROM openttd:base

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    \
    binutils \
    g++ \
    gcc \
    debhelper \
    fakeroot \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

ENTRYPOINT ["/bin/bash"]
