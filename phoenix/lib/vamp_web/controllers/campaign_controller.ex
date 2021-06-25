defmodule VampWeb.CampaignController do
  use VampWeb, :controller

  alias Vamp.Brand
  alias Vamp.Brand.Campaign

  action_fallback VampWeb.FallbackController

  def index(conn, _params) do
    campaigns = Brand.list_campaigns()
    render(conn, "index.json", campaigns: campaigns)
  end

  def create(conn, %{"campaign" => campaign_params}) do
    with {:ok, %Campaign{} = campaign} <- Brand.create_campaign(campaign_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.campaign_path(conn, :show, campaign))
      |> render("show.json", campaign: campaign)
    end
  end

  def show(conn, %{"id" => id}) do
    campaign = Brand.get_campaign!(id)
    render(conn, "show.json", campaign: campaign)
  end

  def update(conn, %{"id" => id, "campaign" => campaign_params}) do
    campaign = Brand.get_campaign!(id)

    with {:ok, %Campaign{} = campaign} <- Brand.update_campaign(campaign, campaign_params) do
      render(conn, "show.json", campaign: campaign)
    end
  end

  def delete(conn, %{"id" => id}) do
    campaign = Brand.get_campaign!(id)

    with {:ok, %Campaign{}} <- Brand.delete_campaign(campaign) do
      send_resp(conn, :no_content, "")
    end
  end
end
