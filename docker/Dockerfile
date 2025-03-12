ARG ROS_BASE_IMAGE
FROM ${ROS_BASE_IMAGE} as ros_base_rclgo

ARG GO_VERSION
ENV GO_VERSION=${GO_VERSION}

ARG TARGETARCH

USER root
RUN apt-get update && \
    apt-get install -y \
        wget \
        vim \
        ros-iron-example-interfaces \
        ros-iron-test-msgs

# Download and install go binary.
RUN GO_TAR=go${GO_VERSION}.linux-${TARGETARCH}.tar.gz && \
    wget -P /tmp "https://dl.google.com/go/${GO_TAR}" && \
    tar -C /usr/local -xzf "/tmp/${GO_TAR}" && \
    rm "/tmp/${GO_TAR}"

# Setup GOPATH.
ENV GOPATH=/go
ENV PATH=${GOPATH}/bin:/usr/local/go/bin:${PATH}
RUN mkdir -p "${GOPATH}/src" && \
    mkdir -p "${GOPATH}/bin" && \
    chmod 777 "${GOPATH}"

USER ${ROS_USER}
WORKDIR ${ROS_USER_HOME}

COPY --chown=${ROS_USER} ./ ${ROS_USER_HOME}/rclgo

RUN cd ${ROS_USER_HOME}/rclgo && \
    source ${ROS_ENV} && \
    make generate && \
    make test

