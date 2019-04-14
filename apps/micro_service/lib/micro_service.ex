defmodule MicroService do
  use Application
  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        plug: MicroService.Router,
        options: [port: 4000]
      )
    ]
    opts = [strategy: :one_for_one, name: MicroService.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
