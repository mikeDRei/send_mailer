defmodule SendMailer.EmailData.SentEmailData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sent_email_data" do
    field :payload, :map

    timestamps()
  end

  @doc false
  def changeset(sent_email_data, attrs) do
    sent_email_data
    |> cast(attrs, [:payload])
    |> validate_required([:payload])
  end
end
