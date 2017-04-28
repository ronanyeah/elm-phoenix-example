defmodule Foo.PageController do
  use Foo.Web, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
