defmodule Server.Exchange.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :exchange, :string
    field :high, :float
    field :low, :float
    field :market_cap, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:type, :exchange, :high, :low, :market_cap])
    |> validate_required([:type, :exchange, :high, :low, :market_cap])
  end
end
