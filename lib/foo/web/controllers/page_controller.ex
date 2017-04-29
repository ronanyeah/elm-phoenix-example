defmodule Foo.Web.PageController do
  use Foo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
