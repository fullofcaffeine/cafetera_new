defmodule CafeteraHubWeb.BeanController do
  use CafeteraHubWeb, :controller

  def action(conn, _) do
    bean_name = conn.params["bean_name"]
    route = conn.params["route"]

    with {:ok, bean} <- Cafetera.Bean.Manager.get_bean(bean_name),
         {:ok, handler} <- find_route_handler(bean, route, conn.method) do
      apply_handler(conn, handler, conn.params)
    else
      _ ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Route not found"})
    end
  end

  defp find_route_handler(bean, route, method) do
    case Enum.find(bean.api_routes, &match_route?(&1, route, method)) do
      nil -> {:error, :not_found}
      route -> {:ok, route.handler}
    end
  end
end
