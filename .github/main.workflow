workflow "Build images" {
  on = "push"
  resolves = ["Builds docker images"]
}

action "Builds docker images" {
  uses = "actions/bin/sh@master"
  runs = "ls -alh && ./bin/docker_build 2.12/alpine scala scala:2.12 scala:2.12-alpine scala:2.12-1.2.3 scala:2.12-1.2.3-alpine"
  env = {
    ORGANIZATION = "jeroenknoops"
    DOCKER_ORGANIZATION = "jeroenknoops"
  }
}
