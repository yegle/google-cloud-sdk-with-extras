FROM debian:stable as build_env

RUN apt-get update && apt-get install -y sqlite3 scrypt

FROM google/cloud-sdk

COPY --from=build_env /usr/bin/sqlite3 /usr/bin/sqlite3
COPY --from=build_env /usr/bin/scrypt /usr/bin/scrypt
