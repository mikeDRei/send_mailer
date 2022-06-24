defmodule SendMailer.Email.SendEmail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "send_email" do
    field :attachment_links, {:array, :string}
    field :bcc, {:array, :string}
    field :cc, {:array, :string}
    field :content, :string
    field :email_name, :string
    field :other_values, :map
    field :subject, :string
    field :to, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(send_email, attrs) do
    send_email
    |> cast(attrs, [:to, :cc, :bcc, :subject, :content, :attachment_links, :other_values, :email_name])
    |> validate_required([:to, :cc, :bcc, :subject, :content, :attachment_links, :other_values, :email_name])
  end
end
