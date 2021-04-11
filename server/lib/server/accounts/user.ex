defmodule Server.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :activated_at, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(user, _attrs) do
    user
    |> validate_required([])
  end
end
