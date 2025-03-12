#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

GO_VERSION=1.20

docker build \
  --progress plain \
  -t rclgo \
  --build-arg ROS_BASE_IMAGE=757639335249.dkr.ecr.us-east-1.amazonaws.com/data-capture/af-onboard/images/ros-base:latest \
  --build-arg GO_VERSION=${GO_VERSION} \
  -f ${SCRIPT_DIR}/Dockerfile ${SCRIPT_DIR}/..

