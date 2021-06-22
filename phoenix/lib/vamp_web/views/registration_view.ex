defmodule VampWeb.RegistrationView do
  use VampWeb, :view
  alias VampWeb.RegistrationView

  def render("index.json", %{sandals: sandals}) do
    %{data: render_many(sandals, SandalView, "sandal.json")}
  end

  def render("show.json", %{sandal: sandal}) do
    %{data: render_one(sandal, SandalView, "sandal.json")}
  end

  def render("sandal.json", %{sandal: sandal}) do
    %{id: sandal.id,
      name: sandal.name,
      code: sandal.code,
      color_set: sandal.color_set}
  end

  def render("success.json", %{user: user}) do
    %{
      status: :ok,
      message: """
        Now you can sign in using your email and password at /api/sign_in. You will receive JWT token.
        Please put this token into Authorization header for all authorized requests.
      """
    }
  end
end
