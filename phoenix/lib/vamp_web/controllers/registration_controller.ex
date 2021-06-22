defmodule VampWeb.RegistrationController do
  use VampWeb, :controller

  alias Vamp.People


  def sign_up(conn, %{"user" => user_params}) do

    case People.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("success.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> send_resp(400, "EWrr")
    end
  end
end
