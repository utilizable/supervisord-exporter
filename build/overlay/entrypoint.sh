#!/bin/bash

/usr/bin/supervisord-exporter \
  -supervisord-url="${SUPERVISORD_URL}" \
  -web.listen-address=":${WEB_LISTEN_ADDRESS}" \
  -web.telemetry-path="${WEB_TELEMETRY_PATH}" 
