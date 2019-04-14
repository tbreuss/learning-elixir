defmodule MinimalServer.Endpoint do
  use Plug.Router

  forward("/bot", to: MinimalServer.Router)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts),
    do: Plug.Adapters.Cowboy2.http(__MODULE__, [])

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end
