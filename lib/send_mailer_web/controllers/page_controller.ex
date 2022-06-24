defmodule SendMailerWeb.PageController do
  use SendMailerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
