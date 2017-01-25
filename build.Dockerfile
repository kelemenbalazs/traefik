FROM containous/traefik-base-image

WORKDIR /go/src/github.com/containous/traefik

COPY glide.yaml glide.yaml
COPY glide.lock glide.lock
RUN glide install -v

COPY integration/glide.yaml integration/glide.yaml
COPY integration/glide.lock integration/glide.lock
RUN cd integration && glide install -v

COPY . /go/src/github.com/containous/traefik
