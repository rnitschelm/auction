defmodule Server.Accounts.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias Server.Accounts.User

  schema "people" do
    field :first_name, :string
    field :last_name, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def create_changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :user_id])
    |> validate_required([:first_name, :last_name, :user_id])
    |> validate_length(:first_name, min: 2, max: 100)
    |> validate_length(:last_name, min: 2, max: 100)
  end
end
