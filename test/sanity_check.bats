#!/usr/bin/env bats

IMAGE=${IMAGE:-jbergstroem/mariadb-client-alpine}
VERSION=${VERSION:-latest}

@test "should output mysql version" {
  run docker run -i --entrypoint mysql "${IMAGE}":"${VERSION}" --version
  [[ "$status" -eq 0 ]]
  [[ "$output" == "mysql  Ver"*"Distrib"* ]]
}
