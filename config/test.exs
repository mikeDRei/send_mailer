import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :send_mailer, SendMailer.Repo,
  # username: "postgres",
  # password: System.get_env("PASSWORD"),
  # hostname: "localhost",
  # database: "send_mailer_test#{System.get_env("MIX_TEST_PARTITION")}",
  url: System.get_env("DATABASE_URL"),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :send_mailer, SendMailerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FeZZhQLX+N8Fvsr7DdJjNBCBhX2fP3npZCrbSmq/BXjR+EMdcDbZEwIiz9q8YZT5",
  server: false

# In test we don't send emails.
config :send_mailer, SendMailer.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
