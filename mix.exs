defmodule Leaks.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_nodejs_leaks,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Leaks, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nodejs, "~> 2.0"}
    ]
  end
end
