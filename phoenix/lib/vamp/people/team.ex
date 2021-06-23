defmodule Vamp.People.Team do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vamp.People.User
  alias Vamp.People.UserTeam

  schema "teams" do
    field :code, :string
    field :color_set, :string
    field :name, :string

    many_to_many(
      :users,
      User,
      join_through: UserTeam,
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :code, :color_set])
    |> validate_required([:name, :code, :color_set])
  end
end
