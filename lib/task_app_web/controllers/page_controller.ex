defmodule TaskAppWeb.PageController do
  use TaskAppWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: Routes.task_path(conn, :index))
  end
end
