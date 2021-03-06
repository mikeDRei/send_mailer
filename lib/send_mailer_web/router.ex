defmodule SendMailerWeb.Router do
  use SendMailerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SendMailerWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SendMailerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", SendMailerWeb do
    pipe_through :api
    post "/send_email", EmailController, :send_email
    post "/save_email_data", EmailController, :save_email_data
    post "/sendgrid/generate_token", AuthorizationController, :generate_sendrid_token 
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SendMailerWeb.Telemetry
    end
  end

  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
