defmodule ElixirMaruTraining.TrackRouter do
  use Maru.Router


  helpers do

     alias ElixirEctoTraining.Track, warn: false
  end


  def allTracks do
    [
        %Track{title: "Todos los dias sale el sol", singer: "Bongo Botrako"}
    ]
  end

  namespace :tracks do

    version "v1" do
      desc "Returns the list of mocked tracks."
      get do
        conn |> json(allTracks)
      end
    end

  end

end