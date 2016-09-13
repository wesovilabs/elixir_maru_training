defmodule ElixirMaruTraining.Api do
  use Maru.Router
  require Logger

   before do
      plug Plug.Logger
      plug Plug.Parsers,
          pass: ["*/*"],
          json_decoder: Poison,
          parsers: [:json]
    end

    mount ElixirMaruTraining.TrackRouterV1
    mount ElixirMaruTraining.TrackRouterV2

    rescue_from Unauthorized, as: e do
        IO.inspect e
        conn
        |> put_status(401)
        |> json(%{message: "This place is not for you, you are unauthorized"})
    end

    rescue_from Maru.Exceptions.NotFound, as: e do
          Logger.debug "#{inspect e}"
          Logger.debug "404: URL Not Found at path /#{inspect e.path_info}"
          conn
          |> put_status(404)
          |> json(%{message: "Hey budy you have no idea where you want to go"})
    end

    rescue_from :all, as: e do
        IO.inspect e
        conn
        |> put_status(500)
        |> json(%{message: "Something went bad! And I do not know what..."})
    end



end