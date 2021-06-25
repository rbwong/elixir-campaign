defmodule Vamp.Brand.CampaignTag do
  @moduledoc """
  CampaignTag module
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Vamp.Brand.Tag
  alias Vamp.Brand.Campaign

  @primary_key false
  schema "campaign_tag" do
    belongs_to(:campaign, Campaign, primary_key: true)
    belongs_to(:tag, Tag, primary_key: true)

    timestamps()
  end
end
