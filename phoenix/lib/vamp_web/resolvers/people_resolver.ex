defmodule VampWeb.PeopleResolver do
  alias Vamp.People

  def all_teams(_root, _args, _info) do
    {:ok, People.list_teams()}
  end

  def all_users(_root, _args, _info) do
    {:ok, People.list_users()}
  end

  def login_user(_root, args, _info) do
    {email, password} = args

    case People.find_and_confirm_password(email, password) do
      {:ok, user} ->
         {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :api)
         {:ok, jwt}
      {:error, reason} -> {:error, reason}
    end
  end
end
