defmodule Buttondown.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/christopherlai/buttondown"
  @name "Buttondown"

  def project do
    [
      app: :buttondown,
      deps: deps(),
      dialyzer: [plt_add_apps: [:jason]],
      docs: docs(),
      elixir: "~> 1.9",
      homepage: @url,
      name: @name,
      package: package(),
      source: @url,
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:hackney, "~> 1.15"},
      {:jason, "~> 1.1", optional: true}
    ]
  end

  defp docs do
    [
      main: @name,
      source_ref: "v#{@version}",
      source_url: @url,
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      description: "Elixir library for Buttondown API",
      files: ["lib", "config", "mix.exs", "README*"],
      maintainers: ["Christopher Lai"],
      licenses: ["MIT"],
      links: %{github: @url}
    ]
  end
end
