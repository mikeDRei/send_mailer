defmodule SendMailer.Service.EmailServer do
  use Bamboo.Phoenix, view: SendMailerWeb.EmailView
  use Bamboo.Mailer, otp_app: :send_mailer
# email_args = %{"attachment_links" => ["asasas"], "bcc" => ["michaalvesreino@gmail.com"], "cc" => ["michaalvesreino@gmail.com"], "content" => "<h2>asasas</h2>", "email_name" => "test", "from" => "michaalvesreino@gmail.com", "other_values" => %{"exam-core" => "454545"}, "subject" => "Welcome!!", "to" => ["michaelalvesreino@gmail.com"]}
  import Bamboo.Email

  def send_email_from(email_args) do
    try do
      new_email()
      |> from(email_args["from"])
      |> cc(email_args["cc"])
      |> to(email_args["to"])
      |> subject(email_args["subject"])
      |> assign(:email_args, email_args)
      |> render(email_args["email_name"] <> ".html")
      |> deliver_now()
    rescue
      e->
        raise "incorrect parameter error"
    end
  end
end
