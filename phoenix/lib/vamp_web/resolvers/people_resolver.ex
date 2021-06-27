defmodule VampWeb.PeopleResolver do
  alias Vamp.People

  def all_teams(_root, _args, _info) do
    {:ok, People.list_teams()}
  end

  def all_users(_root, _args, _info) do
    {:ok, People.list_users()}
  end

  def assign_user_team(_root, args, _info) do
    case People.upsert_user_teams(args.user_id, args.team_id) do
      {:ok, user} -> {:ok, user}
      {:error, reason} -> {:error, reason}
    end
  end

  def login_user(_root, args, _info) do
    case People.find_and_confirm_password(args.email, args.password) do
      {:ok, user} ->
         {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :api)
         {:ok, %{token: jwt}}
      {:error, reason} -> {:error, reason}
    end
  end
end
