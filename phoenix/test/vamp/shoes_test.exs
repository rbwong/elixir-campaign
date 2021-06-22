defmodule Vamp.ShoesTest do
  use Vamp.DataCase

  alias Vamp.Shoes

  describe "sandals" do
    alias Vamp.Shoes.Sandal

    @valid_attrs %{code: "some code", color_set: "some color_set", name: "some name"}
    @update_attrs %{code: "some updated code", color_set: "some updated color_set", name: "some updated name"}
    @invalid_attrs %{code: nil, color_set: nil, name: nil}

    def sandal_fixture(attrs \\ %{}) do
      {:ok, sandal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shoes.create_sandal()

      sandal
    end

    test "list_sandals/0 returns all sandals" do
      sandal = sandal_fixture()
      assert Shoes.list_sandals() == [sandal]
    end

    test "get_sandal!/1 returns the sandal with given id" do
      sandal = sandal_fixture()
      assert Shoes.get_sandal!(sandal.id) == sandal
    end

    test "create_sandal/1 with valid data creates a sandal" do
      assert {:ok, %Sandal{} = sandal} = Shoes.create_sandal(@valid_attrs)
      assert sandal.code == "some code"
      assert sandal.color_set == "some color_set"
      assert sandal.name == "some name"
    end

    test "create_sandal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shoes.create_sandal(@invalid_attrs)
    end

    test "update_sandal/2 with valid data updates the sandal" do
      sandal = sandal_fixture()
      assert {:ok, %Sandal{} = sandal} = Shoes.update_sandal(sandal, @update_attrs)
      assert sandal.code == "some updated code"
      assert sandal.color_set == "some updated color_set"
      assert sandal.name == "some updated name"
    end

    test "update_sandal/2 with invalid data returns error changeset" do
      sandal = sandal_fixture()
      assert {:error, %Ecto.Changeset{}} = Shoes.update_sandal(sandal, @invalid_attrs)
      assert sandal == Shoes.get_sandal!(sandal.id)
    end

    test "delete_sandal/1 deletes the sandal" do
      sandal = sandal_fixture()
      assert {:ok, %Sandal{}} = Shoes.delete_sandal(sandal)
      assert_raise Ecto.NoResultsError, fn -> Shoes.get_sandal!(sandal.id) end
    end

    test "change_sandal/1 returns a sandal changeset" do
      sandal = sandal_fixture()
      assert %Ecto.Changeset{} = Shoes.change_sandal(sandal)
    end
  end
end
