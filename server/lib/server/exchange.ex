defmodule Server.Exchange do
  @moduledoc """
  The Exchange context.
  """

  import Ecto.Query, warn: false

  def fetch_quotes() do
    case HTTPoison.get!("https://rest.coinapi.io/v1/assets", headers()) do
      %{status_code: 200, body: body} -> Poison.decode!(body)
      %{} -> []
    end
  end

  defp headers() do
    ["X-CoinAPI-Key": Application.fetch_env!(:api_keys, :coin_api)]
  end
end
