defmodule Buttondown.NewsletterTest do
  use ExUnit.Case, async: true
  alias Buttondown.Newsletter
  alias Buttondown.Operation

  describe "list/0" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/newsletters",
               data: nil
             } = Newsletter.list()
    end
  end

  describe "create/3" do
    test "returns a post operation" do
      encoded_data =
        Jason.encode!(%{username: "Username", name: "Name", description: "Description"})

      assert %Operation{
               http_method: :post,
               url: "https://api.buttondown.email/v1/newsletters",
               data: ^encoded_data
             } = Newsletter.create("Username", "Name", "Description")
    end
  end

  describe "get/1" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/newsletters/123-abc",
               data: nil
             } = Newsletter.get("123-abc")
    end
  end

  describe "update/2" do
    test "returns a patch operation" do
      encoded_data = Jason.encode!(%{username: "NewUsername"})

      assert %Operation{
               http_method: :patch,
               url: "https://api.buttondown.email/v1/newsletters/123-abc",
               data: ^encoded_data
             } = Newsletter.update("123-abc", %{username: "NewUsername"})
    end
  end

  describe "delete/1" do
    test "returns a delete operation" do
      assert %Operation{
               http_method: :delete,
               url: "https://api.buttondown.email/v1/newsletters/123-abc",
               data: nil
             } = Newsletter.delete("123-abc")
    end
  end
end
