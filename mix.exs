defmodule Stack.MixProject do
  use Mix.Project

  def project do
    [
      app: :stack,
      version: "0.2.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :sasl],
      mod: {
        Stack.Application, []
      },
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 2.1", runtime: false},
    ]
  end
end
