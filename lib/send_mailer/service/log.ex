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
    if info == :success,
      do: info("Data received from sendgrid! and successfully saved #{dateTime()}")

    if info == :error, 
      do: error("Error data received from sendgrid not saved #{dateTime()}")
      
  end
end
