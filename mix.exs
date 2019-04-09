defmodule LoaderioPlug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :loaderio_plug,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: ["test.watch": :test],
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:plug, "~> 1.8"},
      {:mix_test_watch, "~> 0.9", only: :test}
    ]
  end
end
