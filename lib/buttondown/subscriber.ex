defmodule Buttondown.Subscriber do
  @moduledoc """
  Manage Buttondown Subscribers.
  """

  alias Buttondown.Operation

  @doc """
  List Subscribers.
  """
  @spec list :: Operation.t()
  def list do
    Operation.new(:get, "/subscribers")
  end

  @doc """
  Create Subscriber.
  """
  @spec create(email :: binary, params :: map) :: Operation.t()
  def create(email, params \\ %{}) do
    Operation.new(:post, "/subscribers", Map.merge(params, %{email: email}))
  end

  @doc """
  Get Subscriber using id.
  """
  @spec get(id :: binary) :: Operation.t()
  def get(id) do
    Operation.new(:get, "/subscribers/#{id}")
  end

  @doc """
  Update Subscriber using id and parameters.
  """
  @spec update(id :: binary, params :: map) :: Operation.t()
  def update(id, params) do
    Operation.new(:patch, "/subscribers/#{id}", params)
  end

  @doc """
  Delete Subscriber using id.
  """
  @spec delete(id :: binary) :: Operation.t()
  def delete(id) do
    Operation.new(:delete, "/subscribers/#{id}")
  end
end
