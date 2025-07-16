#!/bin/bash

# =================================================================
# Script to build and push a Docker image to Docker Hub.
# =================================================================

# --- Configuration ---
# Your Docker Hub username.
DOCKER_USERNAME="train860"

# The name of the image.
IMAGE_NAME="glance"

# The tag for the image (e.g., latest, v1.0).
IMAGE_TAG="latest"

# The final image name with tag.
FULL_IMAGE_NAME="${DOCKER_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

# --- Script Start ---
echo "Starting Docker image build and push process..."

# 1. Build the Docker image
echo "Building image: ${FULL_IMAGE_NAME}"
docker build -t "${FULL_IMAGE_NAME}" .

# Check if the build command was successful
if [ $? -ne 0 ]; then
    echo "Error: Docker build failed."
    exit 1
fi

echo "Image built successfully."

# 2. Log in to Docker Hub
# You will be prompted to enter your password securely.
echo "Please log in to Docker Hub..."
docker login -u "${DOCKER_USERNAME}"

# Check if the login command was successful
if [ $? -ne 0 ]; then
    echo "Error: Docker login failed."
    exit 1
fi

echo "Login successful."

# 3. Push the image to Docker Hub
echo "Pushing image to Docker Hub: ${FULL_IMAGE_NAME}"
docker push "${FULL_IMAGE_NAME}"

# Check if the push command was successful
if [ $? -ne 0 ]; then
    echo "Error: Docker push failed."
    exit 1
fi

echo "--------------------------------------------------"
echo "✅ Successfully pushed image to Docker Hub!"
echo "Repository: ${FULL_IMAGE_NAME}"
echo "--------------------------------------------------"
