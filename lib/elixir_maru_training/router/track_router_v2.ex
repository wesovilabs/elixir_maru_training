defmodule ElixirMaruTraining.TrackRouterV2 do
  use Maru.Router
  import Ecto.Query
  require Logger
  alias ElixirEctoTraining.Track, warn: true
  alias ElixirEctoTraining.Repo, warn: true


  def allTracks do
    query = from track in ElixirEctoTraining.Track,
        select: (
            %{ trackId: track.id, title: track.title, singer: track.singer}
        )
    query |> ElixirEctoTraining.Repo.all
  end

  def inserTrack(track) do
    ElixirEctoTraining.Repo.insert(track)
  end

  namespace :tracks do

    version "v2" do

        @desc "Return the list of tracks in the database"
        get do
            tracks_as_json = allTracks()
            |> List.wrap
            |> Poison.encode!
            Logger.debug "Tracks #{inspect tracks_as_json}"
            conn
            |> put_status(200)
            |> json(tracks_as_json)
        end



         @desc "Add a new track and return a 201 http status code"
         params do
            requires :title, type: String
            requires :singer, type: String
            optional :score, type: Atom, values: [:bad, :normal, :good, :awesome], default: :normal
         end
         post do
            track = %Track{title: params[:title], singer: params[:singer]}
            inserTrack(track)
            conn
            |> put_status(204)
            |> json(%{})
         end
     end

  end

end