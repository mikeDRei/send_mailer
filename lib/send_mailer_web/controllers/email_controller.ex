defmodule SendMailerWeb.EmailController do
  use SendMailerWeb, :controller

  alias SendMailer.Email
  alias SendMailer.Service.EmailServer
  alias SendMailer.Email.SendEmail

  action_fallback SendMailerWeb.FallbackController


  def send_email(conn, %{"email_args" => email_params}) do
    try do
      if(SendEmail.changeset(%SendEmail{}, email_params).valid?) do
        EmailServer.send_email_from(email_params)
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
end
