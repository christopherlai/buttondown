defmodule Buttondown.DraftTest do
  use ExUnit.Case, async: true
  alias Buttondown.Draft
  alias Buttondown.Operation

  describe "list/0" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/drafts",
               data: nil
             } = Draft.list()
    end
  end

  describe "create/1" do
    test "returns a post operation" do
      encoded_data = Jason.encode!(%{subject: "Subject", body: "Body"})

      assert %Operation{
               http_method: :post,
               url: "https://api.buttondown.email/v1/drafts",
               data: ^encoded_data
             } = Draft.create("Subject", "Body")
    end
  end

  describe "get/1" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/drafts/123-abc",
               data: nil
             } = Draft.get("123-abc")
    end
  end
end
