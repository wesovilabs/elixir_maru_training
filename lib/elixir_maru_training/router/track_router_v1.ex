defmodule ElixirMaruTraining.TrackRouterV1 do
  use Maru.Router
  require Logger
  alias ElixirEctoTraining.Track, warn: true
  alias ElixirMaruTraining.TrackResource

  def allTracks do
    [
        %TrackResource{title: "Todos los dias sale el sol", singer: "Bongo Botrako"},
        %TrackResource{title: "Mi jefe", singer: "Mojinos Escozios"}
    ]
  end



  namespace :tracks do

    version "v1" do

        @desc "Return the list of mocked tracks"
        get do
            tracks = allTracks()
            Logger.debug "Tracks #{inspect tracks}"
            conn
            |> put_status(200)
            |> json(tracks)
        end


        @desc "Add a new track and return a 201 http status code"
        params do
          requires :title, type: String
          requires :singer, type: String
          optional :score, type: Atom, values: [:bad, :normal, :good, :awesome], default: :normal
        end
        post do
            track = %Track{title: params[:title], singer: params[:singer]}
            conn
            |> put_status(204)
            |> json(%{})
        end
    end
  end

end