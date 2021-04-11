defmodule Server.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :activated_at, :naive_datetime

      timestamps()
    end

    create table(:people) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:people, [:user_id])
  end
end
