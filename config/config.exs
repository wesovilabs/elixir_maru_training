use Mix.Config

config :maru, ElixirMaruTraining.Api,

    versioning: [
        using: :path
    ],
    http: [
        port: 5002
    ]


config :elixir_maru_training,
    ecto_repos: [ ElixirEctoTraining.Repo ]

config :elixir_ecto_training, ElixirEctoTraining.Repo,
      adapter: Ecto.Adapters.Postgres,
      database: "elixir_ecto_training_db",
      username: "wesovi",
      password: "wesoviPass",
      hostname: "localhost",
      port: "3001",
      pool: Ecto.Adapters.SQL.Sandbox

config :elixir_ecto_training, base_url: (Mix.env == :dev && "http://127.0.0.1:5002/")