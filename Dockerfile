FROM alpine:3.18.6 AS builder

LABEL org.opencontainers.image.authors="NaveenKumar Namachivayam"
LABEL org.opencontainers.image.url="https://qainsights.com"
LABEL org.opencontainers.image.description="Apache JMeter Dockerfile for GitHub Actions with JMeter Plugins"
LABEL org.opencontainers.image.version="1.0"

ENV JMETER_VERSION="5.6.3" \
    JMETER_HOME="/opt/apache/apache-jmeter-5.6.3" \
    JMETER_BIN="/opt/apache/apache-jmeter-5.6.3/bin" \
    JMETER_CMD_RUNNER_VERSION="2.3" \
    JMETER_PLUGIN_MANAGER_VERSION="1.9" \
    JMETER_PLUGIN_INSTALL_LIST="jpgc-udp,jpgc-graphs-basic" \
    PATH="$PATH:/opt/apache/apache-jmeter-5.6.3/bin"

# Copy scripts
COPY entrypoint.sh /entrypoint.sh
COPY jmeter-plugin-install.sh /jmeter-plugin-install.sh

# Install dependencies, download and setup JMeter in a single layer
RUN apk --no-cache add curl ca-certificates openjdk17-jre && \
    # Download and extract JMeter
    curl -L https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz --output /tmp/apache-jmeter-${JMETER_VERSION}.tgz && \
    mkdir -p /opt/apache && \
    tar -zxf /tmp/apache-jmeter-${JMETER_VERSION}.tgz -C /tmp && \
    mv /tmp/apache-jmeter-${JMETER_VERSION} /opt/apache/ && \
    # Make scripts executable
    chmod +x /entrypoint.sh /jmeter-plugin-install.sh && \
    # Install JMeter plugins
    /jmeter-plugin-install.sh && \
    # Clean up
    rm -rf /tmp/* /var/cache/apk/*

# Use a smaller final image
FROM alpine:3.18.6

# Copy labels from builder
LABEL org.opencontainers.image.authors="NaveenKumar Namachivayam"
LABEL org.opencontainers.image.url="https://qainsights.com"
LABEL org.opencontainers.image.description="Apache JMeter Dockerfile for GitHub Actions with JMeter Plugins"
LABEL org.opencontainers.image.version="1.0"

# Set environment variables
ENV JMETER_VERSION="5.6.3" \
    JMETER_HOME="/opt/apache/apache-jmeter-5.6.3" \
    JMETER_BIN="/opt/apache/apache-jmeter-5.6.3/bin" \
    PATH="$PATH:/opt/apache/apache-jmeter-5.6.3/bin"

# Install only the required runtime dependencies
RUN apk --no-cache add openjdk17-jre

# Copy JMeter and scripts from builder
COPY --from=builder /opt/apache /opt/apache
COPY --from=builder /entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
