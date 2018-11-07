Instructions
============

## Usage

To start up the image

    docker run -it -p 8080:8080 docker.digital.homeoffice.gov.uk/bstp/auth:latest

## Building the image

    docker build -t="docker.digital.homeoffice.gov.uk/bstp/auth:latest" --rm .

## Pushing the image to Docker Hub

    docker push docker.digital.homeoffice.gov.uk/bstp/auth:latest

## How to customize the image

The following environment variables control configuration of the app:

    KEYCLOAK_USER=admin
    KEYCLOAK_PASSWORD=password123!
    UI_URL=http://localhost:8080/
