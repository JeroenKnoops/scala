workflow "Build images" {
  on = "push"
  resolves = [
    "Builds docker images",
    "listing",
  ]
}

action "Builds docker images" {
  uses = "actions/bin/sh@master"
  runs = "./bin/docker_build 2.12/alpine scala scala:2.12 scala:2.12-alpine scala:2.12-1.2.3 scala:2.12-1.2.3-alpine"
  env = {
    ORGANIZATION = "jeroenknoops"
    DOCKER_ORGANIZATION = "jeroenknoops"
  }
}

action "listing" {
  uses = "actions/bin/sh@master"
  args = ["ls -ltr"]
}
