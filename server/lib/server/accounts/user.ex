defmodule Server.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Server.Accounts.Company

  schema "users" do
    field :activated_at, :naive_datetime
    field :email, :string
    field :password, :string, virtual: true, redact: true
    field :password_hash, :string
    field :status, Ecto.Enum, values: [:draft, :active, :inactive], default: :draft

    belongs_to :company, Company

    timestamps()
  end

  @doc false
  def create_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :company_id])
    |> validate_required([:email, :password, :company_id])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:email, min: 5, max: 256)
    |> validate_length(:password, min: 8, max: 100)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end
end
