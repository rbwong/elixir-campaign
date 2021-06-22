defmodule Vamp.Shoes.Sandal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sandals" do
    field :code, :string
    field :color_set, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(sandal, attrs) do
    sandal
    |> cast(attrs, [:name, :code, :color_set])
    |> validate_required([:name, :code, :color_set])
  end
end
