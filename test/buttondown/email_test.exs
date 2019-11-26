defmodule Buttondown.EmailTest do
  use ExUnit.Case, async: true
  alias Buttondown.Email
  alias Buttondown.Operation

  describe "list/0" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/emails",
               data: nil
             } = Email.list()
    end
  end

  describe "create/1" do
    test "returns a post operation" do
      encoded_data = Jason.encode!(%{subject: "Subject", body: "Body", email_type: "string"})

      assert %Operation{
               http_method: :post,
               url: "https://api.buttondown.email/v1/emails",
               data: ^encoded_data
             } = Email.create("Subject", "Body", %{email_type: "string"})
    end
  end

  describe "get/1" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/emails/123-abc",
               data: nil
             } = Email.get("123-abc")
    end
  end
end
