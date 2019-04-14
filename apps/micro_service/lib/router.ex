defmodule MicroService.Router do

  use Plug.Router
  alias MicroService.API

  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  plug :dispatch

  get "/hello" do
    #send_resp(conn, 200, "Hello World!")
    API.HelloEndpoint.show(conn)
  end

  match _ do
    send_resp(conn, 404, "Page Missing")
  end

end
