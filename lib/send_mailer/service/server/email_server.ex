defmodule SendMailer.Service.Server.EmailServer do
  use Bamboo.Phoenix, view: SendMailerWeb.EmailView
  use Bamboo.Mailer, otp_app: :send_mailer

  import Bamboo.Email
  import Logger

  def send_email_from(email_args) do
    try do
      new_email()
      |> from(System.get_env("EMAIL_FROM"))
      |> bcc(email_args["cc"])
      |> to(email_args["to"])
      |> subject(email_args["subject"])
      |> assign(:email_args, email_args)
      |> put_attachment(Bamboo.Attachment.new(root_path(), filename: "poc.png",
        content_type: "image/png", content_id: "poc.png"))
      |> render(email_args["email_name"] <> ".html")
      |> deliver_now()
      info("Email sent to sendgrid")
    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end

  def root_path() do
    Path.absname("lib/send_mailer/service/images/poc.png")
  end
end
