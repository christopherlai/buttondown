defmodule Buttondown do
  @moduledoc """
  Library for Buttondown.
  """

  alias Buttondown.{Configuration, Operation, Request}
  alias Buttondown.Request.Hackney

  @type ping_return :: Operation.t()

  @doc """
  Verify if configured API Token is valid.

  ## Example

      iex> Buttondown.ping() |> Buttondown.request()
      {:ok, %{}}

  """
  @spec ping :: ping_return
  def ping do
    Buttondown.Operation.new(:get, "/ping")
  end

  @doc """
  Makes a API request to Buttondown for the given operation.

  ## Example
      iex> Buttondown.Subscriber.list() |> Buttondown.request()
      {:ok, %{
        "count" => 0,
        "next" => nil, 
        "previous" => nil,
        "results" => []
      }}
  """
  @spec request(Operation.t()) :: Request.return()
  def request(operation) do
    Hackney.request(operation, Configuration.new())
  end
end
