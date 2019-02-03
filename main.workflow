workflow "Credo & Sobelow & Check Formatting" {
  on = "push"
  resolves = [
    "Credo",
    "Formatter",
    "Sobelow",
  ]
}

action "Get Dependencies" {
  uses = "nitrino/actions@master"
  args = "deps.get"
}

action "Credo" {
  uses = "nitrino/actions@master"
  args = "credo --strict"
  needs = ["Get Dependencies"]
}

action "Formatter" {
  uses = "nitrino/actions@master"
  args = "format --check-formatted"
  needs = ["Get Dependencies"]
}

action "Sobelow" {
  uses = "nitrino/actions@master"
  needs = ["Get Dependencies"]
  args = "sobelow --config"
}
