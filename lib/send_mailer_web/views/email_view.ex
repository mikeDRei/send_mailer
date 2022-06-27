defmodule SendMailerWeb.EmailView do
  use SendMailerWeb, :view
  alias SendMailerWeb.EmailView

  def render("index.json", %{email_args: email_args}) do
    %{data: render_many(email_args, EmailView, "email_args.json")}
  end

  def render("show.json", %{email_args: email_args}) do
    %{data: render_one(email_args, EmailView, "email_args.json")}
  end

  def render("email_args.json", %{email_args: email_args}) do
    %{
      from: email_args.cc,
      cc: email_args.cc,
      bcc: email_args.bcc,
      to: email_args.to,
      subject: email_args.subject,
      content: email_args.content,
      attachment_links: email_args.attachment_links,
      other_values: email_args.other_values,
      email_name: email_args.email_name
    }
  end

  def listReportContent(report_content, split_arg) do
    report_content |> String.split(split_arg)
  end 
end
