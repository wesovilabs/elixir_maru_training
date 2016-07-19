defmodule ElixirMaruTraining.TrackRouterV2 do
  use Maru.Router
  require Logger
  alias ElixirEctoTraining.Track, warn: true
  alias ElixirEctoTraining.Repo, warn: true


  namespace :tracks do

    version "v2" do

        @desc "Return the list of tracks in the database"
        get do
            tracks_as_json = Repo.Track.all
            |> List.wrap
            |> Poison.encode!

            Logger.debug "Tracks #{inspect tracks_as_json}"
            conn
            |> put_status(200)
            |> json(tracks_as_json)

        end

    end
  end

end