defmodule Vamp.Brand.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vamp.Brand.Campaign
  alias Vamp.Brand.CampaignTag

  schema "tags" do
    field :name, :string

    many_to_many(
      :campaigns,
      Campaign,
      join_through: CampaignTag,
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
