defmodule SendMailer.Service.Server.EmailServer do
  use Bamboo.Phoenix, view: SendMailerWeb.EmailView
  use Bamboo.Mailer, otp_app: :send_mailer

  import Bamboo.Email
  import Logger

  def send_email_from(email_args) do
    try do
      if(email_args["attachment_links"] != nil) do
        email_headers(email_args)
        |> put_attachment(attachment(email_args["attachment_links"]))
        |> deliver_now()
      else
        email_headers(email_args)
        |> deliver_now()
      end
        info("Email sent to sendgrid")
    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e)
    end
  end

  def email_headers(email_args) do
    new_email()
    |> from(System.get_env("EMAIL_FROM"))
    |> bcc(email_args["cc"])
    |> to(email_args["to"])
    |> subject(email_args["subject"])
    |> assign(:email_args, email_args)
    |> render(email_args["email_name"] <> ".html")
  end

  defp attachment(path) do
    Bamboo.Attachment.new(path,
      filename: Path.basename(path) , 
      content_type: content_filename(path), 
      data: "content")
  end

  defp content_filename(path) do
    extname = String.replace(Path.extname(path),".","")
    case extname do
      "png" -> "image/#{extname}"
      "jpg" -> "image/#{extname}"
      "jpeg" -> "image/#{extname}"
      "pdf" -> "application/#{extname}"
      _ -> raise "Invalid file type!"
    end
  end
end
