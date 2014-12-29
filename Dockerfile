FROM busybox

RUN mkdir /data && \
	chown 102:105 /data && \
	chmod 700 /data

# Create
VOLUME /data
