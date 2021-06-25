defmodule Vamp.Repo.Migrations.CreateCampaigns do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :name, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :budget, :decimal
      add :descsription, :string
      add :team_id, references(:teams), null: false

      timestamps()
    end

  end
end
