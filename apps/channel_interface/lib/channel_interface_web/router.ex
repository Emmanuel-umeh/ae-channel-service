defmodule ChannelInterfaceWeb.Router do
  use ChannelInterfaceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChannelInterfaceWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/connect", ConnectController, only: [:new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChannelInterfaceWeb do
  #   pipe_through :api
  # end
end
