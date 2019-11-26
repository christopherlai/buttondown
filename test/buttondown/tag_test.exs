defmodule Buttondown.TagTest do
  use ExUnit.Case, async: true
  alias Buttondown.Operation
  alias Buttondown.Tag

  describe "list/0" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/tags",
               data: nil
             } = Tag.list()
    end
  end

  describe "create/3" do
    test "returns a post operation" do
      encoded_data = Jason.encode!(%{name: "awesome tag", color: "#0062B1"})

      assert %Operation{
               http_method: :post,
               url: "https://api.buttondown.email/v1/tags",
               data: ^encoded_data
             } = Tag.create("awesome tag", %{color: "#0062B1"})
    end
  end

  describe "get/1" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/tags/123-abc",
               data: nil
             } = Tag.get("123-abc")
    end
  end

  describe "update/2" do
    test "returns a patch operation" do
      encoded_data = Jason.encode!(%{username: "NewUsername"})

      assert %Operation{
               http_method: :patch,
               url: "https://api.buttondown.email/v1/tags/123-abc",
               data: ^encoded_data
             } = Tag.update("123-abc", %{username: "NewUsername"})
    end
  end

  describe "delete/1" do
    test "returns a delete operation" do
      assert %Operation{
               http_method: :delete,
               url: "https://api.buttondown.email/v1/tags/123-abc",
               data: nil
             } = Tag.delete("123-abc")
    end
  end
end
