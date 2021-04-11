defmodule Server.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :activated_at, :naive_datetime
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:email, min: 5, max: 256)
    |> unique_constraint(:email)
  end
end
