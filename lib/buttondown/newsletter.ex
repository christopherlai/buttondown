defmodule Buttondown.Newsletter do
  @moduledoc """
  Manage Buttondown Newsletters
  """

  alias Buttondown.Operation

  @doc """
  List Newsletters.
  """
  @spec list :: Operation.t()
  def list do
    Operation.new(:get, "/newsletters")
  end

  @doc """
  Create Newsletter.
  """
  @spec create(username :: binary, name :: binary, description :: binary) :: Operation.t()
  def create(username, name, description) do
    Operation.new(:post, "/newsletters", %{
      username: username,
      name: name,
      description: description
    })
  end

  @doc """
  Get Newsletter using id.
  """
  @spec get(id :: binary) :: Operation.t()
  def get(id) do
    Operation.new(:get, "/newsletters/#{id}")
  end

  @doc """
  Update Newsletter using id and parameters.
  """
  @spec update(id :: binary, newsletter :: map) :: Operation.t()
  def update(id, newsletter) do
    Operation.new(:patch, "/newsletters/#{id}", newsletter)
  end

  @doc """
  Delete Newsletter using id.
  """
  @spec delete(id :: binary) :: Operation.t()
  def delete(id) do
    Operation.new(:delete, "/newsletters/#{id}")
  end
end
