use Mix.Config

config :maru, ElixirMaruTraining.API,

    versioning: [
        using: :path
    ],
    http: [port: 5001]

config :elixir_ecto_training, ecto_repos: [ElixirEctoTraining.Repo]

config :elixir_ecto_training, ElixirEctoTraining.Repo,
      adapter: Ecto.Adapters.Postgres,
      database: "elixir_ecto_training_db",
      username: "wesovi",
      password: "wesoviPass",
      hostname: "localhost",
      port: "3001",
      pool: Ecto.Adapters.SQL.Sandbox

config :elixir_ecto_training, base_url: (Mix.env == :dev && "http://localhost:5001/elixir_ecto_training/" || "http://elixir_ecto_training.herokuapp.com/")