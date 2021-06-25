defmodule Vamp.Repo.Migrations.AddCampaignTags do
  use Ecto.Migration

  def change do
    create table(:campaign_tag, primary_key: false) do
      add(:campaign_id, references(:campaigns, on_delete: :delete_all), primary_key: true)
      add(:tag_id, references(:tags, on_delete: :delete_all), primary_key: true)
      timestamps()
    end

    create(index(:campaign_tag, [:campaign_id]))
    create(index(:campaign_tag, [:tag_id]))
  end
end
