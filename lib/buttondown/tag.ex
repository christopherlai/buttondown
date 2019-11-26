defmodule Buttondown.Tag do
  @moduledoc """
  Manage Buttondown Tags/
  """

  alias Buttondown.Operation

  @doc """
  List Tags.
  """
  @spec list :: Operation.t()
  def list do
    Operation.new(:get, "/tags")
  end

  @doc """
  Create Tag.
  """
  @spec create(name :: binary, params :: map) :: Operation.t()
  def create(name, params \\ %{}) do
    Operation.new(:post, "/tags", Map.merge(params, %{name: name}))
  end

  @doc """
  Get Tag using id.
  """
  @spec get(id :: binary) :: Operation.t()
  def get(id) do
    Operation.new(:get, "/tags/#{id}")
  end

  @doc """
  Update Tag using id and parameters.
  """
  @spec update(id :: binary, tag :: map) :: Operation.t()
  def update(id, tag) do
    Operation.new(:patch, "/tags/#{id}", tag)
  end

  @doc """
  Delete Tag using id.
  """
  @spec delete(id :: binary) :: Operation.t()
  def delete(id) do
    Operation.new(:delete, "/tags/#{id}")
  end
end
