defmodule Buttondown.Draft do
  @moduledoc """
  Manage Buttondown Drafts.
  """

  alias Buttondown.Operation

  @doc """
  List Drafts.
  """
  @spec list :: Operation.t()
  def list do
    Operation.new(:get, "/drafts")
  end

  @doc """
  Create a Draft.
  """
  @spec create(subject :: binary, body :: binary) :: Operation.t()
  def create(subject, body) do
    Operation.new(:post, "/drafts", %{subject: subject, body: body})
  end

  @doc """
  Get Draft using id.
  """
  @spec get(id :: binary) :: Operation.t()
  def get(id) do
    Operation.new(:get, "/drafts/#{id}")
  end
end
