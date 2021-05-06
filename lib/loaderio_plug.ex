defmodule Loaderio.Plug do
  import Plug.Conn
  require Logger

  def init(options \\ []), do: options

  def call(conn = %{path_info: [path_token]}, options) do
    if path_token == verification_token(options) do
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, path_token)
      |> halt
    else
      conn
    end
  end

  def call(conn, _opts), do: conn

  defp verification_token(options) do
    case Keyword.get(options, :token) do
      nil -> verification_token_from_system_env()
      token when is_function(token) -> token.()
      token -> token
    end
  end

  defp verification_token_from_system_env, do: System.get_env("LOADERIO_VERIFICATION_TOKEN")
end
