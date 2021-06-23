defmodule Vamp.Repo.Migrations.AddUserTeam do
  use Ecto.Migration

  def change do
    create table(:user_team, primary_key: false) do
      add(:team_id, references(:teams, on_delete: :delete_all), primary_key: true)
      add(:user_id, references(:users, on_delete: :delete_all), primary_key: true)
      timestamps()
    end

    create(index(:user_team, [:team_id]))
    create(index(:user_team, [:user_id]))
  end
end
