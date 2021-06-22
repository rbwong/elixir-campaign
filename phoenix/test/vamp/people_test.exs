defmodule Vamp.PeopleTest do
  use Vamp.DataCase

  alias Vamp.People

  describe "teams" do
    alias Vamp.People.Team

    @valid_attrs %{code: "some code", color_set: "some color_set", name: "some name"}
    @update_attrs %{code: "some updated code", color_set: "some updated color_set", name: "some updated name"}
    @invalid_attrs %{code: nil, color_set: nil, name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert People.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert People.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = People.create_team(@valid_attrs)
      assert team.code == "some code"
      assert team.color_set == "some color_set"
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = People.update_team(team, @update_attrs)
      assert team.code == "some updated code"
      assert team.color_set == "some updated color_set"
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_team(team, @invalid_attrs)
      assert team == People.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = People.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> People.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = People.change_team(team)
    end
  end

  describe "users" do
    alias Vamp.People.User

    @valid_attrs %{email: "some email", is_admin: true, name: "some name", password_hash: "some password_hash", phone: "some phone"}
    @update_attrs %{email: "some updated email", is_admin: false, name: "some updated name", password_hash: "some updated password_hash", phone: "some updated phone"}
    @invalid_attrs %{email: nil, is_admin: nil, name: nil, password_hash: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert People.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert People.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = People.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.is_admin == true
      assert user.name == "some name"
      assert user.password_hash == "some password_hash"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = People.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.is_admin == false
      assert user.name == "some updated name"
      assert user.password_hash == "some updated password_hash"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_user(user, @invalid_attrs)
      assert user == People.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = People.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> People.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = People.change_user(user)
    end
  end
end
