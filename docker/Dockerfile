ARG ROS_DISTRO=galactic

FROM ros:${ROS_DISTRO}

# Install packages for Dlang
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libxml2 \
    clang \
    lld \
    lldb \
    curl \
    wget \
    xz-utils \
    ca-certificates \
    zlib1g-dev \
    libssl-dev \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ARG DC=ldc
RUN mkdir -p /opt/dlang && curl -fsS https://dlang.org/install.sh | bash -s -- $DC -p /opt/dlang
RUN find /opt/dlang -name activate | xargs echo source | tee -a /etc/bash.bashrc \
    && find /opt/dlang -maxdepth 1 -mindepth 1 -type d | xargs chmod 755

RUN ln -sf lld /usr/bin/ld


RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
