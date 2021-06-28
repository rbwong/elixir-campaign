defmodule Mix.Tasks.Upload.Campaigns do
  use Mix.Task

  alias Vamp.People
  alias Vamp.Brand
  alias Vamp.Brand.Campaign

  @shortdoc "Seeds the database from csv files"

  def run(_args) do
    Mix.Task.run("app.start")
    Mix.shell().info("Uploading seeds to DB")
    upload_teams()
    upload_users()
    upload_memberships()
    upload_campaigns()
    Mix.shell().info("Finished")
  end

  defp upload_teams() do
    teams = import_from_csv("test/support/teams.csv")

    teams
    |> Enum.map(fn {:ok, data} ->
      case People.create_team(data) do
        {:ok, team} -> {:ok, team}
        {:error, reason} -> {:error, reason}
      end
    end)
  end

  defp upload_users() do
    users = import_from_csv("test/support/users.csv")

    users
    |> Enum.map(fn {:ok, data} ->
      case People.create_user(data) do
        {:ok, user} -> {:ok, user}
        {:error, reason} -> {:error, reason}
      end
    end)
  end

  defp upload_memberships() do
    memberships = import_from_csv("test/support/memberships.csv")

    memberships
    |> Enum.map(fn {:ok, data} ->
      case People.upsert_user_teams(data["user_id"], data["team_id"]) do
        {:ok, user} -> {:ok, user}
        {:error, reason} -> {:error, reason}
      end
    end)
  end

  defp upload_campaigns() do
    campaigns = import_from_csv("test/support/campaigns.csv")

    campaigns
    |> Enum.map(fn {:ok, data} ->

      team = People.get_team!(data["team_id"])

      # Create map
      campaign_data = %{
        team_id: data["team_id"],
        name: data["name"],
        descsription: data["description"],
        budget: data["budget"],
        start_date: data["start_date"],
        end_date: data["end_date"],
      }

      # Insert campaign to DB
      {_, campaign_id} = case Brand.create_campaign(campaign_data) do
        {:ok, campaign} -> {:ok, campaign.id}
        {:error, reason} -> {:error, reason}
      end

      # Parse hashtags
      hashtags = data["hashtags"]
      |> String.replace("#", " ")
      |> String.split

      # Insert campaign to DB
      tag_ids = hashtags
      |> Enum.map(fn hashtag ->
        {_, tag} = case Brand.create_tag(%{name: hashtag}) do
          {:ok, tag} -> {:ok, tag.id}
          {:error, reason} -> {:error, reason}
        end
        tag
      end)

      # Assign Tags to Campaign
      case Brand.upsert_campaign_tags(campaign_id, tag_ids) do
        {:ok, campaign} -> {:ok, campaign}
        {:error, reason} -> {:error, reason}
      end
    end)
  end

  # Imports csv file, parses it and converts it to a List of Maps
  defp import_from_csv(csv_path) do
    csv_path
      |> Path.relative()
      |> File.stream!()
      |> CSV.decode(headers: true)
      |> Enum.to_list()
  end
end
