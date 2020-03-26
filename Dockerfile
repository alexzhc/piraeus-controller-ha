FROM quay.azk8s.cn/piraeusdatastore/piraeus-server:v1.4.2

COPY client-go-0.17.4/examples/leader-election/election /

ENTRYPOINT [ "/election" ]