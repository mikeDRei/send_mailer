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
      email: sent_email_data.email,
      event: sent_email_data.event,
      event_id: sent_email_data.event_id,
      message_id: sent_email_data.message_id,
      event_hour: sent_email_data.event_hour,
      event_date: sent_email_data.event_date
    }
  end
end
