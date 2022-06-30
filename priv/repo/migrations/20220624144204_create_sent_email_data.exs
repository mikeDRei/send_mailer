defmodule SendMailer.Repo.Migrations.CreateSentEmailData do
  use Ecto.Migration

  def change do
    create table(:sent_email_data) do
      add :email, :string
      add :event, :string
      add :event_id, :string
      add :message_id, :string
      add :event_time, :string

      timestamps()
    end
  end
end
