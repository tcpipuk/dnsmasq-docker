FROM alpine:latest

# Install dnsmasq
RUN apk add --no-cache dnsmasq

# Expose DNS and DHCP ports
EXPOSE 53 53/udp
EXPOSE 67/udp

# Run dnsmasq; it needs to run in the foreground for Docker
ENTRYPOINT ["dnsmasq", "-k"]
