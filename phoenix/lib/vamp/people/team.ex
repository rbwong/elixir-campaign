defmodule Vamp.People.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :code, :string
    field :color_set, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :code, :color_set])
    |> validate_required([:name, :code, :color_set])
  end
end
