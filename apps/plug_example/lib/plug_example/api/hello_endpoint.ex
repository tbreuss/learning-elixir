defmodule PlugExample.API.HelloEndpoint do
  import Plug.Conn
  def show(conn) do
    send_resp(conn, 200, "Hello World!")
  end

  def show(conn, name) do
    send_resp(conn, 200, "Hello #{String.capitalize(name)}!")
  end

end
