defmodule SendMailerWeb.SentEmailDataController do
  use SendMailerWeb, :controller

  alias SendMailer.EmailData
  alias SendMailer.EmailData.SentEmailData

  action_fallback SendMailerWeb.FallbackController

  def index(conn, _params) do
    sent_email_data = EmailData.list_sent_email_data()
    render(conn, "index.json", sent_email_data: sent_email_data)
  end

  def create(conn, %{"sent_email_data" => sent_email_data_params}) do
    with {:ok, %SentEmailData{} = sent_email_data} <- EmailData.create_sent_email_data(sent_email_data_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sent_email_data_path(conn, :show, sent_email_data))
      |> render("show.json", sent_email_data: sent_email_data)
    end
  end

  def show(conn, %{"id" => id}) do
    sent_email_data = EmailData.get_sent_email_data!(id)
    render(conn, "show.json", sent_email_data: sent_email_data)
  end

  def update(conn, %{"id" => id, "sent_email_data" => sent_email_data_params}) do
    sent_email_data = EmailData.get_sent_email_data!(id)

    with {:ok, %SentEmailData{} = sent_email_data} <- EmailData.update_sent_email_data(sent_email_data, sent_email_data_params) do
      render(conn, "show.json", sent_email_data: sent_email_data)
    end
  end

  def delete(conn, %{"id" => id}) do
    sent_email_data = EmailData.get_sent_email_data!(id)

    with {:ok, %SentEmailData{}} <- EmailData.delete_sent_email_data(sent_email_data) do
      send_resp(conn, :no_content, "")
    end
  end
end
