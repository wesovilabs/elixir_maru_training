Mix.shell.cmd "mix ecto.drop"
Mix.shell.cmd "mix ecto.load"
ExUnit.start()