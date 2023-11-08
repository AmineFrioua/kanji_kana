defmodule KanjiKana.MixProject do
  use Mix.Project

  def project do
    [
      app: :kanji_kana,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {KanjiKana.Application, []},
      extra_applications: [:logger],
      ecto_repos: [KanjiKana.Repo]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7.1", only: [:dev, :test], runtime: false},
      {:ecto_sql, "~> 3.10.2"},
      {:ex_machina, "~> 2.7"},
      {:nimble_csv, "~> 1.2"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
