defmodule SendMailer.Service.EmailServerTest do
  use ExUnit.Case
  use Bamboo.Test

  alias SendMailer.Service.EmailServer

  import SendMailer.Factory

  describe "send_email/1" do
    test "Email successfully sent" do
      email_args = email_factory()

      email = EmailServer.send_email_from(email_args)

      assert email
    end
  end
end
