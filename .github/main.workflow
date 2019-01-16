workflow "New workflow" {
  on = "push"
  resolves = ["Build"]
}

action "install" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  runs = "npm"
  args = "install"
}

action "Test" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  needs = ["install"]
  runs = "npm"
  args = "test"
  env = {
    CI = "true"
  }
}

action "Build" {
  uses = "actions/npm@e7aaefed7c9f2e83d493ff810f17fa5ccd7ed437"
  needs = ["Test"]
  runs = "npm"
  args = "run build"
}
