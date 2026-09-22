# Get the official Docker CLI
FROM docker:29-cli AS dockercli

# Start with Jenkins
FROM jenkins/jenkins:lts-jdk17

USER root

# Copy the official Docker CLI into Jenkins
COPY --from=dockercli /usr/local/bin/docker /usr/local/bin/docker

# Verify Docker CLI exists during image build
RUN docker --version

USER jenkins
