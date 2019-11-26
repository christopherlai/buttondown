defmodule Buttondown.Configuration do
  @moduledoc """
  Configurations for Buttondown API requests.
  """

  @base_headers ["Content-Type": "application/json"]

  @type t :: %__MODULE__{
          headers: keyword(),
          parser: module() | nil
        }
  @type parser :: Jason | module() | nil

  defstruct headers: [], parser: nil

  @doc """
  Retruns a new Configuration struct with Authorization headers and parser.
  """
  @spec new :: t
  def new do
    config = runtime()
    headers = build_headers(@base_headers, config[:api_token])
    parser = config[:json_library] || Jason

    struct(__MODULE__, headers: headers, parser: parser)
  end

  @spec build_headers(keyword(), binary) :: keyword()
  defp build_headers(headers, token) do
    Keyword.merge(headers, Authorization: "Token #{token}")
  end

  @spec runtime :: keyword()
  defp runtime do
    config = Application.get_all_env(:buttondown)

    unless config[:api_token] do
      raise "Missing :apt_token for :buttondown config."
    end

    config
  end
end
