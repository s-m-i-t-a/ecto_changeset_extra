defmodule EctoChangesetExtra.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_changeset_extra,
      version: "0.4.0",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev},
      {:credo, "~> 1.4", only: [:dev, :test]},
      {:excoveralls, "~> 0.12", only: :test},
      {:result, "~> 1.5"},
      {:ecto, "~> 3.4"}
    ]
  end
end
