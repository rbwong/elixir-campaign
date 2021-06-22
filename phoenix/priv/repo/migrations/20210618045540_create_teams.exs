defmodule Vamp.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :code, :string
      add :color_set, :string

      timestamps()
    end

  end
end
