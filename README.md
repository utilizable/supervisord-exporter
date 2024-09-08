# Supervisord Exporter - Docker Image

The **Supervisor Exporter** is a Go application designed to collect process status information from the Supervisor process control system and expose it as Prometheus metrics. This allows you to monitor the state of processes managed by Supervisor.

All credit goes to the original creator of [Supervisord Exporter](https://github.com/salimd/supervisord_exporter) - [salmid](https://github.com/salimd). I'm here only to dockerized it :)

## Usage

Self Explanatory docker-compose example.

```yaml
version: "3"
services:
  supervisord:
    image: supervisord:latest
    ports:
      - "9001:9001"
    volumes:
      - ./supervisord.conf:/etc/supervisord.conf
  supervisord_exporter:
    image: yourdockerimage/supervisord-exporter:latest
    ports:
      - "8080:8080"
    environment:
      SUPERVISORD_URL: "http://supervisord:9001/RPC2"
      WEB_LISTEN_ADDRESS: "8080"
      WEB_TELEMETRY_PATH: "/metrics"
```
