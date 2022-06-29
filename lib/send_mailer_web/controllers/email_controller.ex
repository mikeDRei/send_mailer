defmodule SendMailerWeb.EmailController do
  use SendMailerWeb, :controller

  alias SendMailer.Service.EmailServer
  alias SendMailer.Email.SendEmail
  alias SendMailer.EmailData
  alias SendMailer.EmailData.SentEmailData

  import Logger

  action_fallback SendMailerWeb.FallbackController

  def send_email(conn, %{"email_args" => email_params}) do
    try do
      if(SendEmail.changeset(%SendEmail{}, email_params).valid?) do
        EmailServer.send_email_from(email_params)

        logger(:success, email_params)
        conn
        |> put_status(:ok)
        |> json(%{
          message: "Email successfully sent sendgrid!",
          status: 200,
          email_content: email_params
        })
      else
        logger(:error, email_params)
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
      sendgrid_params =
        %{type_email: "email_template: test.html",
          payload: sendgrid_args
        }
      if(SentEmailData.changeset(%SentEmailData{}, sendgrid_params).valid?) do
        EmailData.create_sent_email_data(sendgrid_params)

        logger(:success_save)

        conn
          |> put_status(:ok)
          |> json(%{
            message: "Email successfully sent sendgrid!",
            status: 200
          })
      else
        logger(:error_save)

        raise "error! parameters of other values may be incorrect or not informed"
        end
      rescue
        e ->
          conn
          |> put_status(:internal_server_error)
          |> json(e.message)
    end
  end

  defp logger(info, email_params) do
    email_args = "to: #{email_params["to"]} cc: #{email_params["cc"]}
                  template: #{email_params["email_name"]}.html,
                  subject: #{email_params["subject"]}, content: #{email_params["content"]}"

    if info == :success,
      do: info("Email sent to sendgrid: email_args #{email_args},
                      timezone: #{Time.utc_now()}")

    if info == :error, 
      do: error("Error sending email, check the parameters informed
          email_args #{email_args}, timezone: #{Time.utc_now()}")
  end

  defp logger(info) do
    if info == :success_save,
      do: info("Email data saved successfully, timezone: #{Time.utc_now()}")

    if info == :error_save, 
      do: error("Error saving e-mail data! parameters of other values may be incorrect
        or not informed, timezone: #{Time.utc_now()}")
  end
end
