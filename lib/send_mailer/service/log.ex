defmodule SendMailer.Service.Log do
  @moduledoc false
  import Logger
  import SendMailer.Service.DateTime

  def log_email_params(info, email_params) do
    email_args = "to: #{email_params["to"]} cc: #{email_params["cc"]}
                  template: #{email_params["email_name"]}.html,
                  subject: #{email_params["subject"]}, content: #{email_params["content"]}"

    if info == :success,
      do: info("Email sent to sendgrid: email_args #{email_args} hour/date: #{utc_hour()} #{utc_date()}")

    if info == :error, 
      do: error("Error sending email, check the parameters informed email_args:
        #{email_args} hour/date: #{utc_hour()} #{utc_date()}")
  end

  def logger(info, message) do
    if info == :success,
      do: info("#{message} hour/date: #{utc_hour()} #{utc_date()}")

    if info == :error, 
      do: error("#{message} hour/date: #{utc_hour()} #{utc_date()}")
  end
end
