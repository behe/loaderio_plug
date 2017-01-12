defmodule Loaderio.Plug do
  import Plug.Conn
  require Logger

  def init(options \\ []), do: Keyword.put_new(options, :token, System.get_env("LOADERIO_VERIFICATION_TOKEN"))

  def call(conn = %{path_info: [token]}, [token: token]) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, token)
  end
  def call(conn, _opts), do: conn
end
