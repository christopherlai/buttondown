defmodule Buttondown.Request do
  @moduledoc """
  Request behaviour.
  """

  alias Buttondown.{Configuration, Operation}

  @type return :: {:ok, term} | {:error, term}

  @doc """
  Executes a request for the given Operation with the given Configuration.
  """
  @callback request(operation :: Operation.t(), config :: Configuration.t()) :: return
end
