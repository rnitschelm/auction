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
  alias Server.Accounts.Company

  def register(registration) do
    Multi.new()
    |> Multi.insert(:company, Company.create_changeset(%Company{}, Map.put(registration, :name, registration.company_name)))
    |> Multi.merge(fn %{company: company} -> create_user(registration, company) end)
    |> Multi.merge(fn %{user: user} -> create_user_associations(registration, user) end)
    |> Repo.transaction()
  end

  def list_users() do
    Repo.all(User)
  end

  defp create_user(registration, company) do
    Multi.new()
    |> Multi.insert(:user, User.create_changeset(%User{}, Map.put(registration, :company_id, company.id)))
  end

  defp create_user_associations(registration, user) do
    Multi.new()
    |> Multi.insert(
      :person,
      Person.create_changeset(%Person{}, Map.put(registration, :user_id, user.id))
    )
  end
end
