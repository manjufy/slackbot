defmodule Slackbot.Router do
  use Plug.Router

  plug :match
  plug Plug.Parsers, parsers: [:json, :urlencoded], json_decoder: Jason
  plug :dispatch

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end