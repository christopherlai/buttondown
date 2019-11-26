defmodule Buttondown.ScheduledTemailsest do
  use ExUnit.Case, async: true
  alias Buttondown.Operation
  alias Buttondown.Schedule

  describe "list/0" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/scheduled-emails",
               data: nil
             } = Schedule.list()
    end
  end

  describe "create/1" do
    test "returns a post operation" do
      publish_date = Date.utc_today() |> Date.to_string()

      encoded_data =
        Jason.encode!(%{subject: "Subject", body: "Body", publish_date: publish_date})

      assert %Operation{
               http_method: :post,
               url: "https://api.buttondown.email/v1/scheduled-emails",
               data: ^encoded_data
             } = Schedule.create("Subject", "Body", publish_date)
    end
  end

  describe "get/1" do
    test "returns a get operation" do
      assert %Operation{
               http_method: :get,
               url: "https://api.buttondown.email/v1/scheduled-emails/123-abc",
               data: nil
             } = Schedule.get("123-abc")
    end
  end
end
