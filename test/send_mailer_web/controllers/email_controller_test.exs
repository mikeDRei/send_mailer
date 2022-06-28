defmodule SendMailerWeb.Controllers.EmailControllerTest do
  use SendMailerWeb, :controller
  use ExUnit.Case
  use Bamboo.Test
  use SendMailerWeb.ConnCase

  alias SendMailerWeb.EmailController

  import SendMailer.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "send_email/1" do
    test "", %{conn: conn} do
      conn = post(conn, Routes.email_path(conn, :send_email), email_args: email_factory())
      assert conn
    end
  end

  describe "save_email_data/1" do
    test "saving email data successfully" do
      email_args = email_factory()

      email = EmailController.save_email_data(email_args)

      assert email
    end
  end
end
