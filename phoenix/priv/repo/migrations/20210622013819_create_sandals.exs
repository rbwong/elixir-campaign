defmodule Vamp.Repo.Migrations.CreateSandals do
  use Ecto.Migration

  def change do
    create table(:sandals) do
      add :name, :string
      add :code, :string
      add :color_set, :string

      timestamps()
    end

  end
end
