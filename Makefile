BINARY=mtt
BINARY_PATH=binary

VERSION=0.0.1
BUILD_TIME=`TZ=UTC date -u '+%Y-%m-%dT%H:%M:%SZ'`
GIT_HASH=`git rev-parse HEAD`

SOURCEDIR=.
SOURCES := $(shell find $(SOURCEDIR) -name '*.go')

LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.BuildTime=${BUILD_TIME} -X main.GitHash=${GIT_HASH}"

.DEFAULT_GOAL: $(BINARY)
$(BINARY): $(SOURCES)
	go build ${LDFLAGS} -o ${BINARY_PATH}/${BINARY} main.go

.PHONY: install clean
install:
	go install ${LDFLAGS} ./...

clean:
	if [ -f ${BINARY_PATH}/${BINARY} ] ; then rm ${BINARY_PATH}/${BINARY} ; fi
