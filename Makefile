build:
	cd client-go-0.17.4/examples/leader-election && \
	rm -vf election && \
	CGO_ENABLED=0 go build -v -a -ldflags '-extldflags "-static"' -o election .

image:	
	docker build . -t daocloud.io/piraeus/piraeus-controller:1.4.2-ha

upload:
	docker push daocloud.io/piraeus/piraeus-controller:1.4.2-ha

all: build image upload