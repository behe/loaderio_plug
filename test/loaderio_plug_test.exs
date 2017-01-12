defmodule Loaderio.PlugTest do
  use ExUnit.Case
  use Plug.Test

  setup do
    System.put_env("LOADERIO_VERIFICATION_TOKEN", "loaderio-env_verification_token")
    on_exit(fn -> System.delete_env("LOADERIO_VERIFICATION_TOKEN") end)
  end

  test "use default env token" do
    options = Loaderio.Plug.init()
    conn = conn(:get, "/loaderio-env_verification_token")
    |> Loaderio.Plug.call(options)

    assert conn.resp_body == "loaderio-env_verification_token"
  end

  test "configured  token overrides env token" do
    options = Loaderio.Plug.init([token: "loaderio-configured_verification_token"])
    conn = conn(:get, "/loaderio-configured_verification_token")
    |> Loaderio.Plug.call(options)

    assert conn.resp_body == "loaderio-configured_verification_token"
  end
end
