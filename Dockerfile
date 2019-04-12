FROM library/golang
RUN mkdir -p /data && (wget -qO- https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz | tar xvz -C /data) && mv /data/Geo* /data/db && go get github.com/klauspost/geoip-service
CMD [ "exec", "geoip-service", "-db=/data/db/GeoLite2-City.mmdb" ]
