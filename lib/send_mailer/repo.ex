defmodule SendMailer.Repo do
  use Ecto.Repo,
    otp_app: :send_mailer,
    adapter: Ecto.Adapters.Postgres
end
