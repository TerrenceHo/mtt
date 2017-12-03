BINARY=qn
BINARY_PATH=binary

VERSION=0.0.1
BUILD_TIME=`TZ=UTC date -u '+%Y-%m-%dT%H:%M:%SZ'`
GIT_HASH=`git rev-parse HEAD`

GOARCH = amd64

SOURCEDIR=.
SOURCES=$(shell find . -type f -name '*.go' -not -path "./vendor/*")
LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.BuildTime=${BUILD_TIME} -X main.GitHash=${GIT_HASH}"

.DEFAULT_GOAL: $(BINARY)
$(BINARY): $(SOURCES)
	go build ${LDFLAGS} -o ${BINARY} -v .

all: linux darwin windows 
	go build ${LDFLAGS} -o ${BINARY} -v .

linux:
	GOOS=linux GOARCH=${GOARCH} go build ${LDFLAGS} -o ${BINARY_PATH}/${BINARY}-linux-${GOARCH} -v .

darwin:
	GOOS=darwin GOARCH=${GOARCH} go build ${LDFLAGS} -o ${BINARY_PATH}/${BINARY}-darwin-${GOARCH} -v .

windows:
	GOOS=windows GOARCH=${GOARCH} go build ${LDFLAGS} -o ${BINARY_PATH}/${BINARY}-windows-${GOARCH}.exe -v .

.PHONY: install clean run
run:
	go run main.go

install:
	go install ${LDFLAGS} ./...

clean:
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi
	rm -f ${BINARY_PATH}/*
