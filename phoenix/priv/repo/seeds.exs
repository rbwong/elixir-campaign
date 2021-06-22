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
alias Vamp.People.Team
alias Vamp.Repo

%Team{name: "District 1", code: "d1", color_set: "red"} |> Repo.insert!
%Team{name: "District 2", code: "d2", color_set: "blue"} |> Repo.insert!
