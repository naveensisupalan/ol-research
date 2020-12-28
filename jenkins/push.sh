#!/bin/bash
podman login -u javarebel -p sound123
podman push olresearch:1.1-SNAPSHOT javarebel/olresearch:${BUILD_NUMBER}
podman push olresearch:1.1-SNAPSHOT javarebel/olresearch:latest