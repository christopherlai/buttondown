defmodule Buttondown.Request.Hackney do
  @moduledoc """
  Implementation of `Buttondown.Request` behaviour for `hackney`.
  """

  require Logger
  alias Buttondown.{Configuration, Request}

  @behaviour Buttondown.Request
  @type hackney_return ::
          {:ok, integer(), keyword()}
          | {:ok, integer(), keyword(), reference()}
          | {:error, {:closed, term}}
          | {:error, term}

  @impl true
  def request(%{http_method: method, url: url, data: nil}, config) do
    method
    |> :hackney.request(url, config.headers)
    |> handle_response(config.parser)
  end

  @impl true
  def request(operation, config) do
    operation.http_method
    |> :hackney.request(operation.url, config.headers, operation.data)
    |> handle_response(config.parser)
  end

  @spec handle_response(response :: hackney_return, Configuration.parser()) :: Request.return()
  defp handle_response({:ok, status, _headers, ref}, parser) when status in [200, 201, 204] do
    with {:ok, body} <- :hackney.body(ref),
         {:ok, response} <- parser.decode(body) do
      {:ok, response}
    else
      {:error, reason} ->
        Logger.error("Unable to complete request. Reason: #{inspect(reason)}")

        {:error, reason}
    end
  end

  defp handle_response({:ok, status, _headers, ref}, parser) when status in [400, 404] do
    with {:ok, body} <- :hackney.body(ref),
         {:ok, response} <- parser.decode(body) do
      {:error, response}
    else
      {:error, reason} ->
        Logger.error("Unable to complete request. Reason: #{inspect(reason)}")

        {:error, reason}
    end
  end
end
