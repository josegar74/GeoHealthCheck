# Docker Installation

## Requirements

Docker installed and daemon running. 
NB: The ``docker`` commands below may need to be prepended with ``sudo``, dependent on your login rights.

## Build

Go to the subdir ``docker/GeoHealthCheck``, where the [Dockerfile](GeoHealthCheck/Dockerfile) resides, and issue:

```
docker build -t yjacolin/geohealthcheck .
````

## Run

Run the webapp.

```
docker run -d --name ghc_web -p 8083:80 -v ghc_db:/GeoHealthCheck/DB yjacolin/geohealthcheck
```

go to http://localhost:8083

Run the app that schedules healthchecks via cron, by overriding entrypoint.

```
docker run -d --name ghc_cron --entrypoint /cron.sh -v ghc_db:/GeoHealthCheck/DB yjacolin/geohealthcheck
```

Check logs: 

Execute ``docker exec -it ghc_cron  bash`` and ``cat /var/log/ghc-hourly.log``.

TODO: possibly run both GHC cron and webapp in single Docker container using ``Supervisord`` (check).
