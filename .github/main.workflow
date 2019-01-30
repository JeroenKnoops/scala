workflow "Build images" {
  on = "push"
  resolves = ["building images"]
}

action "building images" {
  uses = "docker://docker"
  args = ["./bin/docker_build.sh 2.12/alpine scala scala:2.12 scala:2.12-alpine scala:2.12-1.2.3 scala:2.12-1.2.3-alpine"]
  env = {
    DOCKER_ORGANIZATION = "jeroenknoops"
    GH_ORGANIZATION = "jeroenknoops"
  }
}
