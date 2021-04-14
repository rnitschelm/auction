defmodule Server.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :type, :string
      add :exchange, :string
      add :high, :float
      add :low, :float
      add :market_cap, :integer

      timestamps()
    end

  end
end
