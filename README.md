# GitHub Action for Elixir Mix

This Action for [Elixir Mix](https://hexdocs.pm/mix/Mix.html) enables arbitrary actions with this `mix` command-line client.

## Usage

An example workflow to run `mix test` is as follows:

```hcl
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
```

Note that by default, `$MIX_ENV` is set to "test", to prevent several times compilation.

Based by [jclem/actions](https://github.com/jclem/actions)
