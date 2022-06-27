defmodule SendMailer.Service.EmailServer do
  use Bamboo.Phoenix, view: SendMailerWeb.EmailView
  use Bamboo.Mailer, otp_app: :send_mailer

  import Bamboo.Email

  def send_email_from(email_args) do
    try do
      new_email()
      |> from(email_args["from"])
      |> bcc(email_args["cc"])
      |> to(email_args["to"])
      |> subject(email_args["subject"])
      |> assign(:email_args, email_args)
      # |> put_attachment(Bamboo.Attachment.new(root_path(), filename: "logotipo.png", content_type: "image/png", content_id: "logotipo.png"))
      |> render(email_args["email_name"] <> ".html")
      |> deliver_now()
    rescue
      e ->
        raise "incorrect parameter error #{e.message}"
    end
  end

  def root_path() do
    Path.absname("lib/send_mailer/service/images/logotipoRosa.png")
  end
end
