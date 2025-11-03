defmodule RealDealApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias RealDealApi.Accounts
  alias RealDealApiWeb.Auth.ErrorResponse

  def init(_options) do
  end

  def call(conn, _opts) do
    # Only assign if :account not already assigned
    case conn.assigns[:account] do
      nil ->
        account_id = get_session(conn, :account_id)

        if account_id == nil, do: raise(ErrorResponse.Unauthorized)

        case Accounts.get_full_account(account_id) do
          nil -> raise(ErrorResponse.Unauthorized)
          account -> assign(conn, :account, account)
        end

      _account ->
        conn
    end
  end
end
