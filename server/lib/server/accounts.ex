defmodule Server.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias Ecto
  alias Server.Repo
  alias Server.Accounts.User
  alias Server.Accounts.Person

  def register(%{first_name: first_name, last_name: last_name}) do
    %Person{}
    |> Person.changeset(%{first_name: first_name, last_name: last_name})
    |> Ecto.Changeset.put_assoc(:user, %User{})
    |> Repo.insert()
  end
end
