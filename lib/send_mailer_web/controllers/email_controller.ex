defmodule SendMailerWeb.EmailController do
  use SendMailerWeb, :controller

  alias SendMailer.Service.EmailServer
  alias SendMailer.Email.SendEmail
  alias SendMailer.EmailData
  alias SendMailer.EmailData.SentEmailData

  action_fallback SendMailerWeb.FallbackController


  def send_email(conn, %{"email_args" => email_params}) do
    try do
      if(SendEmail.changeset(%SendEmail{}, email_params).valid?) do
        EmailServer.send_email_from(email_params)

        save_email_data(email_params)

        conn
        |> put_status(:ok)
        |> json(%{
          message: "Email successfully sent!",
          status: 200,
          email_content: email_params
        })
      else
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

  def save_email_data (email_params) do
    sent_email_data_params =
      %{exam_code: email_params["other_values"]["exam_code"],
        type_email: "Diagnosy_report_email, email_template: #{email_params["email_name"]}",
        payload: email_params
      }
    if(SentEmailData.changeset(%SentEmailData{}, sent_email_data_params).valid?) do
      EmailData.create_sent_email_data(sent_email_data_params)
    else
      raise "error! parameters of other values may be incorrect or not informed"
    end
  end
end
