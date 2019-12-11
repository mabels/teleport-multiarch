FROM golang:buster
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y make git zip gcc libc-dev docker curl jq
#RUN cd /usr/local/bin && \
#  curl -LO https://storage.googleapis.com/kubernetes-release/release/${KubectlVersion}/bin/linux/${KubectlArch}/kubectl && \
#  chmod 755 kubectl
RUN mkdir -p $GOPATH/src/github.com/gravitational && \
  cd $GOPATH/src/github.com/gravitational && \
  git clone https://github.com/gravitational/teleport.git && \
  cd $GOPATH/src/github.com/gravitational/teleport && \
  git tag latest
ADD . /go/builder/
CMD ["go"]
