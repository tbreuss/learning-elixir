defmodule PlugExample.Router do
  use Plug.Router
  alias PlugExample.API

  plug(:match)
  plug(:dispatch)

  get("/") do
    API.IndexEndpoint.show(conn)
  end

  get("/hello/:name") do
    API.HelloEndpoint.show(conn, conn.params["name"])
  end

  get("/hello") do
    API.HelloEndpoint.show(conn)
  end

  match(_, do: send_resp(conn, 404, "Not Found"))

end
