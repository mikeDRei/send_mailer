defmodule SendMailerWeb.SentEmailDataView do
  use SendMailerWeb, :view
  alias SendMailerWeb.SentEmailDataView

  def render("index.json", %{sent_email_data: sent_email_data}) do
    %{data: render_many(sent_email_data, SentEmailDataView, "sent_email_data.json")}
  end

  def render("show.json", %{sent_email_data: sent_email_data}) do
    %{data: render_one(sent_email_data, SentEmailDataView, "sent_email_data.json")}
  end

  def render("sent_email_data.json", %{sent_email_data: sent_email_data}) do
    %{
      id: sent_email_data.id,
      type_email: sent_email_data.type_email,
      payload: sent_email_data.payload
    }
  end
end
