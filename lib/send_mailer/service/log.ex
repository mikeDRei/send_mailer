defmodule SendMailer.Service.Log do
  import Logger
  import SendMailer.Service.DateTime
  def logger(info, email_params) do
    email_args = "to: #{email_params["to"]} cc: #{email_params["cc"]}
                  template: #{email_params["email_name"]}.html,
                  subject: #{email_params["subject"]}, content: #{email_params["content"]}"

    if info == :success,
      do: info("Email sent to sendgrid: email_args #{email_args} #{dateTime()}")

    if info == :error, 
      do: error("Error sending email, check the parameters informed email_args:
        #{email_args} #{dateTime()}")
  end

  def logger(info) do
    if info == :success_save,
      do: info("Email data saved successfully #{dateTime()}")

    if info == :error_save, 
      do: error("Error saving e-mail data! parameters of other values may be incorrect
        or not informed #{dateTime()}")
      
  end
end
