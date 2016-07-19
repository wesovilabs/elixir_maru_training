defmodule ElixirMaruTraining do
use Application

   def start(_type, _args) do
     import Supervisor.Spec, warn: true
     children = [
     #¡  worker(ElixirEctoTraining.Repo, [])
     ]
     opts = [strategy: :one_for_one, name: ElixirMaruTraining.Supervisor]
     Supervisor.start_link(children, opts)
   end

end