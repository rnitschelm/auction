defmodule Server.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias Ecto
  alias Ecto.Multi
  alias Server.Repo
  alias Server.Accounts.User
  alias Server.Accounts.Person

  def list_users() do
    Repo.all(User)
  end

  def register(registration) do
    Multi.new()
    |> Multi.insert(:user, User.create_changeset(%User{}, registration))
    |> Multi.merge(fn %{user: user} -> create_user_associations(registration, user) end)
    |> Repo.transaction()
  end

  defp create_user_associations(registration, user) do
    Multi.new()
    |> Multi.insert(
      :person,
      Person.create_changeset(%Person{}, Map.put(registration, :user_id, user.id))
    )
  end
end
