ARG ROS_DISTRO

FROM ros:${ROS_DISTRO}

# Install packages for Dlang
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libxml2 \
    clang \
    lld \
    curl \
    wget \
    xz-utils \
    ca-certificates \
    zlib1g-dev \
    libssl-dev \
    libclang-dev \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN ln -sf lld /usr/bin/ld

ARG DC=ldc
RUN mkdir -p /opt/dlang && curl -fsS https://dlang.org/install.sh | bash -s -- $DC

RUN . `find ~/dlang -name activate | head -n1` && \
    CC=clang dub build -y dpp && \
    CC=clang dub build -y dfmt

COPY generate_rcl.d /tmp/
COPY .editorconfig ./

ARG ROS_DISTRO
CMD . `find ~/dlang -name activate | head -n1` && CC=clang rdmd /tmp/generate_rcl.d ${ROS_DISTRO}
