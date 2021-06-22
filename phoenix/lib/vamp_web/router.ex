defmodule VampWeb.Router do
  use VampWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  pipeline :graphql do
    plug(
      Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Poison
    )

    plug(Guardian.Plug.VerifyHeader)
    plug(Guardian.Plug.LoadResource, allow_blank: true)
  end

  pipeline :authenticated do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api", VampWeb do
    pipe_through :api

    post "/sign_up", RegistrationController, :sign_up
    post "/sign_in", SessionController, :sign_in

    pipe_through :authenticated
    resources "/users", UserController, except: [:new, :edit]
  end

  scope "/graphql" do
    pipe_through([:api, :authenticated])

    forward(
      "/",
      Absinthe.Plug,
      schema: VampWeb.Schema,
    )
  end

  scope "/graphiql" do
    forward(
      "/",
      Absinthe.Plug.GraphiQL,
      schema: VampWeb.Schema,
      context: %{pubsub: VampWeb.Endpoint}
    )
  end
end
