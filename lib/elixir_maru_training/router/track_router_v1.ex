defmodule ElixirMaruTraining.TrackRouterV1 do
  use Maru.Router
  require Logger
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
            |> List.wrap
            |> Poison.encode!
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
            track = %TrackResource{title: params[:title], singer: params[:singer]}
            tracks_as_json = [track | allTracks()]
            |> List.wrap
            |> Poison.encode!
            conn
            |> put_status(201)
            |> json(tracks_as_json)
        end
    end
  end

end