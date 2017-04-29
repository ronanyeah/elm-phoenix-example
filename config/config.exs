# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :foo,
  ecto_repos: [Foo.Repo]

# Configures the endpoint
config :foo, Foo.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zh5zNghTMV0H/iO7mvU3KjAg+4h3RDRFCp8MFUa2ggjPc9tHd4KsMqSE6GuVBXTh",
  render_errors: [view: Foo.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Foo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
