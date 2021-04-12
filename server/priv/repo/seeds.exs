# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Server.Repo.insert!(%Server.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Server.Accounts

Accounts.register(%{
  first_name: "Pietertje",
  last_name: "Boomsma",
  email: "pietertje@mail.com",
  password: "verystrong",
  company_name: "Harries Frikandellenfabriek"
})

Accounts.register(%{
  first_name: "Barrie",
  last_name: "Van de Boer",
  email: "barie.boer@gmail.com",
  password: "verystrong",
  company_name: "Bloemenzaak de Groene Baggerkoe"
})

Accounts.register(%{
  first_name: "Adriana",
  last_name: "Curry",
  email: "a.curry@hoogle.nom",
  password: "verystrong",
  company_name: "Transportbedrijf Jay-jay van Damme XIV"
})

Accounts.register(%{
  first_name: "Antoinette",
  last_name: "De Boer",
  email: "a.de.boer@foogle.bom",
  password: "verystrong",
  company_name: "Fabeltjesmagazine BV"
})
