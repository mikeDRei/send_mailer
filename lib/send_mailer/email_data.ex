defmodule SendMailer.EmailData do
  @moduledoc """
  The EmailData context.
  """

  import Ecto.Query, warn: false
  alias SendMailer.Repo

  alias SendMailer.EmailData.SentEmailData

  def list_sent_email_data do
    Repo.all(SentEmailData)
  end

  def get_sent_email_data!(id), do: Repo.get!(SentEmailData, id)

  def get_email!(email) do
    query = from sent_email in "sent_email_data",
      where: sent_email.email == ^email,
      select: [:id, :email, :event_id, :event_hour, :event_date, :message_id]
    Repo.all(query)
  end

  def create_sent_email_data(attrs \\ %{}) do
    %SentEmailData{}
    |> SentEmailData.changeset(attrs)
    |> Repo.insert()
  end

  def update_sent_email_data(%SentEmailData{} = sent_email_data, attrs) do
    sent_email_data
    |> SentEmailData.changeset(attrs)
    |> Repo.update()
  end

  def delete_sent_email_data(%SentEmailData{} = sent_email_data) do
    Repo.delete(sent_email_data)
  end

  def change_sent_email_data(%SentEmailData{} = sent_email_data, attrs \\ %{}) do
    SentEmailData.changeset(sent_email_data, attrs)
  end
end
