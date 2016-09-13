defmodule ElixirMaruTraining.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_maru_training,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps()]
  end

  def application do
    [applications: [:maru, :elixir_ecto_training],
     mod: {ElixirMaruTraining,[]}]
  end

  defp deps do
    [
        {:maru, "~> 0.10.4"} ,
        {:poison, "~> 2.0"},
        {:plug, git: "https://github.com/elixir-lang/plug.git", tag: "v1.1.6", override: true},
        {:elixir_ecto_training, git: "https://github.com/wesovilabs/elixir_ecto_training.git", tag: "0.1.0"},
        {:exkorpion, path: "../exkorpion", only: [:dev, :test]},
        {:httpoison, "~> 0.9.0", only: [:test]}
    ]
  end

  defp aliases do
    [
        "ecto.setup": [
            "ecto.drop", "ecto.create",  "ecto.load", "ecto.migrate", "test"
        ],
        "test": [
            "ecto.setup"
        ]
    ]
   end
end
