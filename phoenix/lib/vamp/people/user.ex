defmodule Vamp.People.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vamp.People.Team
  alias Vamp.People.UserTeam

  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :phone, :string

    many_to_many(
      :teams,
      Team,
      join_through: UserTeam,
      on_replace: :delete
    )

    timestamps()
  end

  def changeset_update_teams(user, teams) do
    user
    |> cast(%{}, [:email, :name, :phone, :password, :password_hash, :is_admin, :inserted_at, :updated_at])
    # associate teams to the user
    |> put_assoc(:teams, teams)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :phone, :password, :is_admin])
    |> validate_required([:email, :name, :password])
    |> validate_changeset
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :phone, :password])
    |> validate_required([:email, :name, :phone, :password])
    |> validate_changeset
  end

  defp validate_changeset(struct) do
    struct
    |> validate_length(:email, min: 5, max: 255)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8)
    |> validate_format(:password, ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*/, [message: "Must include at least one lowercase letter, one uppercase letter, and one digit"])
    |> generate_password_hash
  end

  defp generate_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
