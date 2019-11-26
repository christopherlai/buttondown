defmodule Buttondown.Email do
  @moduledoc """
  Manage Buttondown Emails
  """

  alias Buttondown.Operation

  @doc """
  List Emails.
  """
  @spec list :: Operation.t()
  def list do
    Operation.new(:get, "/emails")
  end

  @doc """
  Create a Email.
  """
  @spec create(subject :: binary, body :: binary, params :: map) :: Operation.t()
  def create(subject, body, params \\ %{}) do
    Operation.new(:post, "/emails", Map.merge(params, %{subject: subject, body: body}))
  end

  @doc """
  Get Email using id.
  """
  @spec get(id :: binary) :: Operation.t()
  def get(id) do
    Operation.new(:get, "/emails/#{id}")
  end
end
