ARG UPSTREAM_VERSION=latest
FROM busybox:1.36.1-musl AS busybox

FROM containers.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake:${UPSTREAM_VERSION}

COPY --from=busybox /bin/busybox /bin/busybox
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN ["/bin/busybox", "chmod", "755", "/usr/local/bin/entrypoint.sh"]

ENTRYPOINT ["/bin/busybox", "sh", "/usr/local/bin/entrypoint.sh"]
  
