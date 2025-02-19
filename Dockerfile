FROM golang:1.24.0-alpine3.20

LABEL "com.github.actions.name"="Broken link check with muffet"
LABEL "com.github.actions.description"="Broken link check quickly with raviqqe/muffet"
LABEL "com.github.actions.icon"="link"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/peaceiris/actions-muffet"
LABEL "homepage"="https://github.com/peaceiris/actions-muffet"
LABEL "maintainer"="peaceiris"

COPY go.mod go.sum /go/src/github.com/peaceiris/actions-muffet/
WORKDIR /go/src/github.com/peaceiris/actions-muffet

RUN apk add --no-cache --virtual .builddeps git && \
    go install github.com/raviqqe/muffet/v2 && \
    apk del --purge .builddeps

ENTRYPOINT [ "/go/bin/muffet" ]
