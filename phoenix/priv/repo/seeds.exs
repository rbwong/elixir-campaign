# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Vamp.Repo.insert!(%Vamp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Vamp.Brand.Campaign
alias Vamp.People
alias Vamp.Repo
alias Vamp.Brand

# %Team{name: "District 1", code: "d1", color_set: "red"} |> Repo.insert!
# %Team{name: "District 2", code: "d2", color_set: "blue"} |> Repo.insert!

team = People.get_team!(2)

# %Campaign{
#   team: team,
#   name: "Nike AF1",
#   descsription: "None",
#   budget: 1500.0,
#   start_date: DateTime.truncate(DateTime.utc_now, :second),
#   end_date: DateTime.truncate(DateTime.utc_now, :second),
# } |> Repo.insert!

%Campaign{
  team: team,
  name: "JAG Linen Shirt",
  descsription: "This is a description",
  budget: 5600.0,
  start_date: DateTime.truncate(DateTime.utc_now, :second),
  end_date: DateTime.truncate(DateTime.utc_now, :second),
} |> Repo.insert!

# Brand.upsert_campaign_tags(4, [1,2,3,6])
Brand.upsert_campaign_tags(6, [4,5,6])
