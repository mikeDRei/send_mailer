defmodule SendMailer.Service.EncryptToken do
  def encrypt(token) do
    :crypto.hash(:sha256, token) 
    |> Base.encode16() 
    |> String.downcase()
  end
end
