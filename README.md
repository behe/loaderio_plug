# LoaderioPlug

Easily configure a loader.io verification token on a Plug/Phoenix app.

## Installation

The package can be installed by adding `loaderio_plug` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:loaderio_plug, github: "behe/loaderio_plug"}]
end
```

Then add the following before your router:

```elixir
plug Loderio.Plug
```

Your loader.io verification token should be set as a system environment variable:

```shell
LOADERIO_VERIFICATION_TOKEN=loaderio-nEPI/zSv50kDgx/QR+3iuyy9ZHlh0Vaz
```
