# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :send_mailer,
  ecto_repos: [SendMailer.Repo]

# Configures the endpoint
config :send_mailer, SendMailerWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SendMailerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SendMailer.PubSub,
  live_view: [signing_salt: "1yhBjG93"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :send_mailer, SendMailer.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# config :send_mailer, SendMailer.Service.Server.EmailServer,
#   adapter: Bamboo.SMTPAdapter,
#   server: "smtp.ethereal.email",
#   hostname: "smtp.ethereal.email",
#   port: 587,
#   username: "",
#   password: "",
#   authentication: :plain,
#   enable_starttls_auto: true,
#   sandbox: false


#Bamboo email Sendgrid
config :send_mailer, SendMailer.Service.Server.EmailServer,
  adapter: Bamboo.SendGridAdapter,
  api_key: System.get_env("SENDGRID_APY_KEY")

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
