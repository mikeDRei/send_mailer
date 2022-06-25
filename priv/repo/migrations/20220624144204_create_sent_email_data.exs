defmodule SendMailer.Repo.Migrations.CreateSentEmailData do
  use Ecto.Migration

  def change do
    create table(:sent_email_data) do
      add :exam_code, :string
      add :type_email, :string
      add :payload, :map

      timestamps()
    end
  end
end
