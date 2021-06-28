defmodule Vamp.Brand.Campaign do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vamp.People.Team
  alias Vamp.Brand.Tag
  alias Vamp.Brand.CampaignTag

  schema "campaigns" do
    belongs_to(:team, Team, foreign_key: :team_id)
    field :budget, :decimal
    field :descsription, :string
    field :end_date, :utc_datetime
    field :name, :string
    field :start_date, :utc_datetime

    many_to_many(
      :tags,
      Tag,
      join_through: CampaignTag,
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(campaign, attrs) do
    campaign
    |> cast(attrs, [:name, :team_id, :start_date, :end_date, :budget, :descsription])
    |> validate_required([:name, :start_date, :end_date, :budget, :descsription])
  end

  def changeset_update_tags(campaign, tags) do
    campaign
    |> cast(%{}, [:budget, :descsription, :end_date, :name, :start_date, :inserted_at, :updated_at])
    # associate tags to the campaign
    |> put_assoc(:tags, tags)
  end

  def changeset_update_team(campaign, team) do
    campaign
    |> cast(%{}, [:budget, :descsription, :end_date, :name, :start_date, :inserted_at, :updated_at])
    # associate team to the campaign
    |> put_assoc(:team, team)
  end
end
