defmodule SendMailerWeb.Controllers.AuthorizationControllerTest do
  use SendMailerWeb, :controller
  use ExUnit.Case
  use Bamboo.Test
  use SendMailerWeb.ConnCase

  alias SendMailerWeb.AuthorizationController

  import SendMailer.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "generate_sendrid_token/2" do
    test "generate auth token for sendgrid", %{conn: conn} do
      conn = post(conn, Routes.authorization_path(conn, :generate_sendrid_token), 
        sendgrid_params: sendgrid_params_factory())
      assert conn
    end
  end

  @tag client_id: System.get_env("CLIENT_ID")
  @tag client_secret: System.get_env("CLIENT_SECRET")
  describe "validate_client_params/2" do
    test "validating sendgrid parameters - client_id and client_secret", 
      %{client_id: client_id, client_secret: client_secret} do
      
      authorization =  AuthorizationController.validate_client_params(client_id, client_secret)
      
      assert authorization  == {:ok, {"the token is valid!"}}
    end
  end
end
