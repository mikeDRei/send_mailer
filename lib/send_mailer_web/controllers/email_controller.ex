defmodule SendMailerWeb.EmailController do
  use SendMailerWeb, :controller

  alias SendMailer.Service.EmailServer
  alias SendMailer.Email.SendEmail
  alias SendMailer.EmailData
  alias SendMailer.EmailData.SentEmailData
  alias SendMailer.Service.Log

  import SendMailer.Service.DateTime

  action_fallback SendMailerWeb.FallbackController

  def send_email(conn, %{"email_args" => email_params}) do
    try do
      if(SendEmail.changeset(%SendEmail{}, email_params).valid?) do
        EmailServer.send_email_from(email_params)

        Log.logger(:success, email_params)
        conn
        |> put_status(:ok)
        |> json(%{
          message: "Email successfully sent sendgrid!",
          status: 200,
          email_content: email_params
        })
      else
        Log.logger(:error, email_params)

        conn
        |> put_status(:bad_request)
        |> json(%{
          message: "Error sending email, check the parameters informed.",
          status: 400,
          params: email_params
        })
      end
      rescue
        e ->
          conn
          |> put_status(:internal_server_error)
          |> json(e.message)
    end
  end

  def save_email_data(conn, sendgrid_args) do
    try do
      Enum.each(0..Enum.count(sendgrid_args["_json"]), 
      fn(index) -> save_sendgrid_payload(index, sendgrid_args) end)

      Log.logger(:success_save)

        conn
          |> put_status(:ok)
          |> json(%{
            message: "Email successfully sent sendgrid!",
            status: 200
          })
      rescue
        e ->
          conn
          |> put_status(:internal_server_error)
          |> json(e.message)
    end
  end

  defp save_sendgrid_payload(index, sendgrid_payload) do
    sendgrid_args = sendgrid_payload["_json"]
    list_sendgrid_args = Enum.at(sendgrid_args, index)

    sendgrid_data = sendgrid_data(list_sendgrid_args["email"], 
                                  list_sendgrid_args["event"], 
                                  list_sendgrid_args["sg_event_id"], 
                                  list_sendgrid_args["sg_message_id"])

      EmailData.create_sent_email_data(sendgrid_data)
  end

  defp sendgrid_data(email, event, event_id, message_id) do
    %{
      email: "#{email}", event: "#{event}", event_id: "#{event_id}",
      message_id: "#{message_id}",
      event_time: "#{dateTime()}"
    }
  end
end
