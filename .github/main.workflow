workflow "Build images" {
  on = "push"
  resolves = ["listing"]
}

action "listing" {
  uses = "actions/bin/sh@master"
  args = ["ls -ltr"]
}
