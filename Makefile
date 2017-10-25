BINARY=mtt
BINARY_PATH=binary

VERSION=0.0.1
BUILD_TIME=`TZ=UTC date -u '+%Y-%m-%dT%H:%M:%SZ'`
GIT_HASH=`git rev-parse HEAD`

LDFLAGS=-ldflags "-s -X main.Version=${VERSION} -X main.BUILD_TIME=${BUILD_TIME} -X main.GIT_HASH=${GIT_HASH}"

all:
	go build ${LDFLAGS} -o ${BINARY_PATH}/${BINARY} main.go
