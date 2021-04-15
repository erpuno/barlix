defmodule Barlix.Mixfile do
  use Mix.Project

  @version "0.6.0"

  def project do
    [
      app: :barlix2,
      version: @version,
      elixir: "~> 1.5",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "Barcode generator",
      package: package(),
      docs: docs(),
      dialyzer: [plt_add_deps: :transitive],
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger, :png2]]
  end

  defp deps do
    [
      {:png2, "~> 1.0.0"},
      {:ex_doc, "~> 0.20.2", only: :dev},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:tempfile, "~> 0.1.0", only: :test},
      {:excheck, "~> 0.6.0", only: :test},
      {:triq, "~> 1.3", only: :test}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/erpuno/barlix2"},
      maintainers: ["ananthakumaran@gmail.com"]
    }
  end

  defp docs do
    [
      source_url: "https://github.com/erpuno/barlix2",
      source_ref: "v#{@version}",
      main: Barlix,
      extras: ["README.md"]
    ]
  end
end
