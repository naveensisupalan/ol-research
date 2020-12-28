#!/bin/bash
echo "Pushing image ${projectName}:${BUILD_NUMBER} to registry ${registry}"
podman login -u $username -p $password
podman push ${projectName}:${BUILD_NUMBER} ${registry}/${projectName}:${BUILD_NUMBER}
podman push ${projectName}:${BUILD_NUMBER} ${registry}/${projectName}:latest