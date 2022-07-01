defmodule SendMailerWeb.Controllers.EmailControllerTest do
  use SendMailerWeb, :controller
  use ExUnit.Case
  use Bamboo.Test
  use SendMailerWeb.ConnCase

  import SendMailer.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "send_email/1" do
    test "send email data to sendgrid", %{conn: conn} do
      conn = post(conn, Routes.email_path(conn, :send_email), email_args: email_factory())
      assert conn
    end
  end

  describe "save_email_data/1" do
    test "saving payload sendgrid successfully", %{conn: conn} do
      conn = post(conn, Routes.email_path(conn, :save_email_data), set_email_data_factory())
      assert conn
    end
  end
end
