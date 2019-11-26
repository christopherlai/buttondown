defmodule Buttondown.SubscriberTest do
  use ExUnit.Case, async: true
  alias Buttondown.Operation
  alias Buttondown.Subscriber

  describe "list/0" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/subscribers",
               data: nil
             } = Subscriber.list()
    end
  end

  describe "create/3" do
    test "returns a post operation" do
      encoded_data = Jason.encode!(%{email: "person@example.com", notes: "Some notes."})

      assert %Operation{
               http_method: :post,
               url: "https://api.buttondown.email/v1/subscribers",
               data: ^encoded_data
             } = Subscriber.create("person@example.com", %{notes: "Some notes."})
    end
  end

  describe "get/1" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/subscribers/123-abc",
               data: nil
             } = Subscriber.get("123-abc")
    end
  end

  describe "update/2" do
    test "returns a patch operation" do
      encoded_data = Jason.encode!(%{username: "NewUsername"})

      assert %Operation{
               http_method: :patch,
               url: "https://api.buttondown.email/v1/subscribers/123-abc",
               data: ^encoded_data
             } = Subscriber.update("123-abc", %{username: "NewUsername"})
    end
  end

  describe "delete/1" do
    test "returns a delete operation" do
      assert %Operation{
               http_method: :delete,
               url: "https://api.buttondown.email/v1/subscribers/123-abc",
               data: nil
             } = Subscriber.delete("123-abc")
    end
  end
end
