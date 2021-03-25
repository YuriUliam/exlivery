defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link()

      :ok
    end

    test "when all params are valid, saves the user" do
      response =
        :user
        |> build()
        |> CreateOrUpdate.call()

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when params are invalid, returns an error" do
      response =
        :user
        |> build(age: 15)
        |> CreateOrUpdate.call()

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
