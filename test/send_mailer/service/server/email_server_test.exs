defmodule SendMailer.Service.Server.EmailServerTest do
  use ExUnit.Case
  use Bamboo.Test

  alias SendMailer.Service.Server.EmailServer

  import SendMailer.Factory

  describe "send_email/1" do
    test "validating the email and data arguments to the template" do
      email_args = email_factory()
      email = EmailServer.send_email_from(email_args)
      assert email
    end
  end
end
