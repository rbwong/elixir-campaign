defmodule Vamp.People.UserTeam do
  @moduledoc """
  UserTeam module
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Vamp.People.User
  alias Vamp.People.Team

  @primary_key false
  schema "user_team" do
    belongs_to(:user, User, primary_key: true)
    belongs_to(:team, Team, primary_key: true)

    timestamps()
  end
end
