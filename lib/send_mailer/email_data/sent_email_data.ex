defmodule SendMailer.EmailData.SentEmailData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sent_email_data" do
    field :exam_code, :string
    field :payload, :string
    field :type_email, :string

    timestamps()
  end

  @doc false
  def changeset(sent_email_data, attrs) do
    sent_email_data
    |> cast(attrs, [:exam_code, :type_email, :payload])
    |> validate_required([:exam_code, :type_email, :payload])
  end
end
