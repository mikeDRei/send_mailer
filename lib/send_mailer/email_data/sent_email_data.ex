defmodule SendMailer.EmailData.SentEmailData do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "sent_email_data" do
    field :email, :string
    field :event, :string
    field :event_id, :string
    field :message_id, :string
    field :event_time, :string

    timestamps()
  end

  @doc false
  def changeset(sent_email_data, attrs) do
    sent_email_data
    |> cast(attrs, [:email, :event, :event_time, :event_id, :message_id])
    |> validate_required([:email, :event, :event_time, :message_id])
  end
end
