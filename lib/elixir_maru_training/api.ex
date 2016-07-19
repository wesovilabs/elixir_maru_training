defmodule ElixirMaruTraining.API do
  use Maru.Router

   before do
      plug Plug.Logger
      plug Plug.Parsers,
          pass: ["*/*"],
          json_decoder: Poison,
          parsers: [:urlencoded, :json, :multipart]
    end

    mount ElixirMaruTraining.TrackRouter

    rescue_from Unauthorized, as: e do
        IO.inspect e
        conn
        |> put_status(401)
        |> json(%{message: "Hey budy you are unauthorized"})
    end

    rescue_from :all, as: e do
        IO.inspect e
        conn
        |> put_status(500)
        |> json(%{message: "Something went bad! And I do not know what..."})
    end

    rescue_from NotFound, as: e do
          IO.inspect e
          conn
          |> put_status(404)
          |> text("Hey budy you have noidea where you want to go")
      end


end