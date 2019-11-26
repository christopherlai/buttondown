defmodule Buttondown.Operation do
  @moduledoc """
  Defines a API request using the Operation struct.
  """

  @base_url "https://api.buttondown.email/v1"

  @type http_methods :: :get | :post | :put | :patch | :delete
  @type t :: %__MODULE__{
          http_method: http_methods,
          url: binary,
          data: binary | nil
        }

  defstruct http_method: :get,
            url: "/",
            data: nil

  @doc """
  Returns a Operation struct for the requested API resource without data.
  """
  @spec new(method :: http_methods(), path :: binary()) :: t
  def new(method, path) do
    %__MODULE__{
      http_method: method,
      url: "#{@base_url}#{path}"
    }
  end

  @doc """
  Returns a Operation struct for the requested API resource with data.
  """
  @spec new(method :: http_methods(), path :: binary(), data :: map()) :: t
  def new(method, path, data) do
    %__MODULE__{
      http_method: method,
      url: "#{@base_url}#{path}",
      data: Jason.encode!(data)
    }
  end
end
