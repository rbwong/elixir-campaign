# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vamp,
  ecto_repos: [Vamp.Repo]

# Configures the endpoint
config :vamp, VampWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HaWRCJ2itmQ0Rr/W7X//ry52kN13R5aU/9W5x3qAAEBG2u20JU76anGJZHZlbqDc",
  render_errors: [view: VampWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Vamp.PubSub,
  live_view: [signing_salt: "RnmKA5D/"]

# Configures Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Vamp",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "ailqMQnjIRfDVP8jNTxjusDqA5b065k0Um6WGrNcLcaPaIZM1XGocfzmZ9kzJiCL",
  serializer: Vamp.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
