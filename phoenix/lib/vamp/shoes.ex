defmodule Vamp.Shoes do
  @moduledoc """
  The Shoes context.
  """

  import Ecto.Query, warn: false
  alias Vamp.Repo

  alias Vamp.Shoes.Sandal

  @doc """
  Returns the list of sandals.

  ## Examples

      iex> list_sandals()
      [%Sandal{}, ...]

  """
  def list_sandals do
    Repo.all(Sandal)
  end

  @doc """
  Gets a single sandal.

  Raises `Ecto.NoResultsError` if the Sandal does not exist.

  ## Examples

      iex> get_sandal!(123)
      %Sandal{}

      iex> get_sandal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sandal!(id), do: Repo.get!(Sandal, id)

  @doc """
  Creates a sandal.

  ## Examples

      iex> create_sandal(%{field: value})
      {:ok, %Sandal{}}

      iex> create_sandal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sandal(attrs \\ %{}) do
    %Sandal{}
    |> Sandal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sandal.

  ## Examples

      iex> update_sandal(sandal, %{field: new_value})
      {:ok, %Sandal{}}

      iex> update_sandal(sandal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sandal(%Sandal{} = sandal, attrs) do
    sandal
    |> Sandal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sandal.

  ## Examples

      iex> delete_sandal(sandal)
      {:ok, %Sandal{}}

      iex> delete_sandal(sandal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sandal(%Sandal{} = sandal) do
    Repo.delete(sandal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sandal changes.

  ## Examples

      iex> change_sandal(sandal)
      %Ecto.Changeset{data: %Sandal{}}

  """
  def change_sandal(%Sandal{} = sandal, attrs \\ %{}) do
    Sandal.changeset(sandal, attrs)
  end
end
