defmodule PlugExample.API.IndexEndpoint do
  import Plug.Conn
  def show(conn) do
    send_resp(conn, 200, "Welcome")
  end
end
