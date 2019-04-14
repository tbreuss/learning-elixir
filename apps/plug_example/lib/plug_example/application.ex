defmodule PlugExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: PlugExample.Worker.start_link(arg)
      # {PlugExample.Worker, arg}
      {
        Plug.Cowboy,
        scheme: :http,
        plug: PlugExample.Router,
        options: [port: 8080]
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugExample.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
