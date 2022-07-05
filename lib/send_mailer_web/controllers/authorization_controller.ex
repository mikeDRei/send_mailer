defmodule SendMailerWeb.AuthorizationController do
  use SendMailerWeb, :controller

  import System
  import SendMailer.Service.EncryptToken

  action_fallback SendMailerWeb.FallbackController

  def generate_sendrid_token(conn, sendgrid_params) do
    try do
      client_id = Tuple.to_list(Enum.at(sendgrid_params, 0))
      client_secret = Tuple.to_list(Enum.at(sendgrid_params, 1))

      validate_client_params(Enum.at(client_id, 1), Enum.at(client_secret, 1))

      bearer_token = Enum.at(client_id, 1) <> Enum.at(client_secret, 1)
      
      encrypt_sendgrid_token_env(bearer_token)
      
      conn
      |> put_status(:ok)
      |> json(%{access_token: encrypt(bearer_token)})
    rescue
      e ->
        conn
        |> put_status(:internal_server_error)
        |> json(e.message)
    end
  end

  defp validate_client_params(id, secret) do
    if(id == get_env("CLIENT_ID") && secret == get_env("CLIENT_SECRET")) do
    else
      raise ArgumentError, message: "Error generating token, credentials are invalid!"
    end
  end

  def encrypt_sendgrid_token_env(bearer_token) do
    put_env("BEARER_TOKEN", "Bearer " <> encrypt(bearer_token))
  end
end
