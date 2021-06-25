defmodule VampWeb.CampaignView do
  use VampWeb, :view
  alias VampWeb.CampaignView

  def render("index.json", %{campaigns: campaigns}) do
    %{data: render_many(campaigns, CampaignView, "campaign.json")}
  end

  def render("show.json", %{campaign: campaign}) do
    %{data: render_one(campaign, CampaignView, "campaign.json")}
  end

  def render("campaign.json", %{campaign: campaign}) do
    %{id: campaign.id,
      name: campaign.name,
      start_date: campaign.start_date,
      end_date: campaign.end_date,
      budget: campaign.budget,
      descsription: campaign.descsription}
  end
end
