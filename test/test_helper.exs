ExUnit.start(capture_log: true)
Ecto.Adapters.SQL.Sandbox.mode(SendMailer.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:ex_machina)
