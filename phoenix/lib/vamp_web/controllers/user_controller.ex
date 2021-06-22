defmodule VampWeb.UserController do
  use VampWeb, :controller

  alias Vamp.People
  alias Vamp.People.User

  action_fallback VampWeb.FallbackController

  def index(conn, _params) do
    users = People.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %user{} = user} <- People.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = People.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = People.get_user!(id)

    with {:ok, %user{} = user} <- People.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = People.get_user!(id)

    with {:ok, %user{}} <- People.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
