defmodule Buttondown.Schedule do
  @moduledoc """
  Manage Buttondown Scheduled Emails.
  """

  alias Buttondown.Operation

  @doc """
  List Scheduled Emails.
  """
  @spec list :: Operation.t()
  def list do
    Operation.new(:get, "/scheduled-emails")
  end

  @doc """
  Create Scheduled Email.
  """
  @spec create(subject :: binary, body :: binary, publish_date :: binary) :: Operation.t()
  def create(subject, body, publish_date) do
    Operation.new(:post, "/scheduled-emails", %{
      subject: subject,
      body: body,
      publish_date: publish_date
    })
  end

  @doc """
  Get Scheduled Email using id.
  """
  @spec get(id :: binary) :: Operation.t()
  def get(id) do
    Operation.new(:get, "/scheduled-emails/#{id}")
  end
end
