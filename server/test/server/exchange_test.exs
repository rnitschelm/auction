defmodule Server.ExchangeTest do
  use Server.DataCase

  alias Server.Exchange

  describe "quotes" do
    alias Server.Exchange.Quote

    @valid_attrs %{exchange: "some exchange", high: 120.5, low: 120.5, market_cap: 42, type: "some type"}
    @update_attrs %{exchange: "some updated exchange", high: 456.7, low: 456.7, market_cap: 43, type: "some updated type"}
    @invalid_attrs %{exchange: nil, high: nil, low: nil, market_cap: nil, type: nil}

    def quote_fixture(attrs \\ %{}) do
      {:ok, quote} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Exchange.create_quote()

      quote
    end

    test "list_quotes/0 returns all quotes" do
      quote = quote_fixture()
      assert Exchange.list_quotes() == [quote]
    end

    test "get_quote!/1 returns the quote with given id" do
      quote = quote_fixture()
      assert Exchange.get_quote!(quote.id) == quote
    end

    test "create_quote/1 with valid data creates a quote" do
      assert {:ok, %Quote{} = quote} = Exchange.create_quote(@valid_attrs)
      assert quote.exchange == "some exchange"
      assert quote.high == 120.5
      assert quote.low == 120.5
      assert quote.market_cap == 42
      assert quote.type == "some type"
    end

    test "create_quote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exchange.create_quote(@invalid_attrs)
    end

    test "update_quote/2 with valid data updates the quote" do
      quote = quote_fixture()
      assert {:ok, %Quote{} = quote} = Exchange.update_quote(quote, @update_attrs)
      assert quote.exchange == "some updated exchange"
      assert quote.high == 456.7
      assert quote.low == 456.7
      assert quote.market_cap == 43
      assert quote.type == "some updated type"
    end

    test "update_quote/2 with invalid data returns error changeset" do
      quote = quote_fixture()
      assert {:error, %Ecto.Changeset{}} = Exchange.update_quote(quote, @invalid_attrs)
      assert quote == Exchange.get_quote!(quote.id)
    end

    test "delete_quote/1 deletes the quote" do
      quote = quote_fixture()
      assert {:ok, %Quote{}} = Exchange.delete_quote(quote)
      assert_raise Ecto.NoResultsError, fn -> Exchange.get_quote!(quote.id) end
    end

    test "change_quote/1 returns a quote changeset" do
      quote = quote_fixture()
      assert %Ecto.Changeset{} = Exchange.change_quote(quote)
    end
  end
end
