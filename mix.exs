defmodule MoxExploration.MixProject do
  use Mix.Project

  def project do
    [
      app: :mox_exploration,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      dialyzer: [plt_add_deps: :transitive],
      deps: deps(),
      docs: docs(),
      aliases: [gh_docs: ["docs -o docs"]],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mox, "~> 0.3", only: :test},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
    ]
  end

  def docs do
    [
      main: "readme",
      # source_url: repo_url(),
      extras: ["README.md"]
    ]
  end
end
