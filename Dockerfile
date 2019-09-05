FROM alpine:3.10.1 as builder

RUN apk add --no-cache postgresql==11.5-r0

FROM alpine:3.10.1

RUN apk add --no-cache libpq==11.5-r0
COPY --from=builder /usr/bin/pgbench /usr/bin/pgbench

ENTRYPOINT ["pgbench"]
