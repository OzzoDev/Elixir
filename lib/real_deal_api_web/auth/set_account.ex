defmodule RealDealApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias RealDealApiWeb.Auth.ErrorResponse

  def init(_options) do
  end

  def call(conn, _opts) do
    account = Guardian.Plug.current_resource(conn)

    if account do
      assign(conn, :account, account)
    else
      raise ErrorResponse.Unauthorized
    end
  end
end
