defmodule VampWeb.BrandResolver do
  alias Vamp.Brand

  def all_tags(_root, _args, _info) do
    {:ok, Brand.list_tags()}
  end

  def all_campaigns(_root, _args, _info) do
    {:ok, Brand.list_campaigns()}
  end

  def assign_campaign_team(_root, args, _info) do
    case Brand.upsert_campaign_team(args.user_id, args.campaign_id) do
      {:ok, user} -> {:ok, user}
      {:error, reason} -> {:error, reason}
    end
  end
end
