# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :task_app,
  ecto_repos: [TaskApp.Repo]

# Configures the endpoint
config :task_app, TaskAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HrGvDATjk7DwOqi+XM/9lifMTdMf+p+eciD1IdO2RGr630h7/2P5NyL3AYQU4B0f",
  render_errors: [view: TaskAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TaskApp.PubSub,
  live_view: [signing_salt: "JOCck9Zl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
