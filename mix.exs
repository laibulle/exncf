defmodule Sncf.Mixfile do
  use Mix.Project

  def project do
    [app: :sncf,
     version: "0.0.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp description do
    """
    A small wrapper for SNCF Open API
    """
  end

  defp package do
    [
    files: ["lib", "mix.exs", "README.md"],
    maintainers: ["Guillaume Bailleul"],
    licenses: ["Apache 2.0"],
    links: %{"GitHub" => "https://github.com/laibulle/exncf",
              "Docs" => "https://hexdocs.pm/exncf/"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 0.11.2"},
    ]
  end
end
