defmodule RealDealApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RealDealApi.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        email: "some email",
        hashed_password_string: "some hashed_password_string"
      })
      |> RealDealApi.Accounts.create_account()

    account
  end
end
