defmodule VampWeb.CampaignControllerTest do
  use VampWeb.ConnCase

  alias Vamp.Brand
  alias Vamp.Brand.Campaign

  @create_attrs %{
    budget: "120.5",
    descsription: "some descsription",
    end_date: "2010-04-17T14:00:00Z",
    name: "some name",
    start_date: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    budget: "456.7",
    descsription: "some updated descsription",
    end_date: "2011-05-18T15:01:01Z",
    name: "some updated name",
    start_date: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{budget: nil, descsription: nil, end_date: nil, name: nil, start_date: nil}

  def fixture(:campaign) do
    {:ok, campaign} = Brand.create_campaign(@create_attrs)
    campaign
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all campaigns", %{conn: conn} do
      conn = get(conn, Routes.campaign_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create campaign" do
    test "renders campaign when data is valid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.campaign_path(conn, :show, id))

      assert %{
               "id" => id,
               "budget" => "120.5",
               "descsription" => "some descsription",
               "end_date" => "2010-04-17T14:00:00Z",
               "name" => "some name",
               "start_date" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update campaign" do
    setup [:create_campaign]

    test "renders campaign when data is valid", %{conn: conn, campaign: %Campaign{id: id} = campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.campaign_path(conn, :show, id))

      assert %{
               "id" => id,
               "budget" => "456.7",
               "descsription" => "some updated descsription",
               "end_date" => "2011-05-18T15:01:01Z",
               "name" => "some updated name",
               "start_date" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, campaign: campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete campaign" do
    setup [:create_campaign]

    test "deletes chosen campaign", %{conn: conn, campaign: campaign} do
      conn = delete(conn, Routes.campaign_path(conn, :delete, campaign))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.campaign_path(conn, :show, campaign))
      end
    end
  end

  defp create_campaign(_) do
    campaign = fixture(:campaign)
    %{campaign: campaign}
  end
end
