defmodule Vamp.BrandTest do
  use Vamp.DataCase

  alias Vamp.Brand

  describe "tags" do
    alias Vamp.Brand.Tag

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brand.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Brand.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Brand.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Brand.create_tag(@valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brand.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Brand.update_tag(tag, @update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Brand.update_tag(tag, @invalid_attrs)
      assert tag == Brand.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Brand.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Brand.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Brand.change_tag(tag)
    end
  end

  describe "campaigns" do
    alias Vamp.Brand.Campaign

    @valid_attrs %{budget: "120.5", descsription: "some descsription", end_date: "2010-04-17T14:00:00Z", name: "some name", start_date: "2010-04-17T14:00:00Z"}
    @update_attrs %{budget: "456.7", descsription: "some updated descsription", end_date: "2011-05-18T15:01:01Z", name: "some updated name", start_date: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{budget: nil, descsription: nil, end_date: nil, name: nil, start_date: nil}

    def campaign_fixture(attrs \\ %{}) do
      {:ok, campaign} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brand.create_campaign()

      campaign
    end

    test "list_campaigns/0 returns all campaigns" do
      campaign = campaign_fixture()
      assert Brand.list_campaigns() == [campaign]
    end

    test "get_campaign!/1 returns the campaign with given id" do
      campaign = campaign_fixture()
      assert Brand.get_campaign!(campaign.id) == campaign
    end

    test "create_campaign/1 with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Brand.create_campaign(@valid_attrs)
      assert campaign.budget == Decimal.new("120.5")
      assert campaign.descsription == "some descsription"
      assert campaign.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert campaign.name == "some name"
      assert campaign.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brand.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{} = campaign} = Brand.update_campaign(campaign, @update_attrs)
      assert campaign.budget == Decimal.new("456.7")
      assert campaign.descsription == "some updated descsription"
      assert campaign.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert campaign.name == "some updated name"
      assert campaign.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_campaign/2 with invalid data returns error changeset" do
      campaign = campaign_fixture()
      assert {:error, %Ecto.Changeset{}} = Brand.update_campaign(campaign, @invalid_attrs)
      assert campaign == Brand.get_campaign!(campaign.id)
    end

    test "delete_campaign/1 deletes the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{}} = Brand.delete_campaign(campaign)
      assert_raise Ecto.NoResultsError, fn -> Brand.get_campaign!(campaign.id) end
    end

    test "change_campaign/1 returns a campaign changeset" do
      campaign = campaign_fixture()
      assert %Ecto.Changeset{} = Brand.change_campaign(campaign)
    end
  end
end
