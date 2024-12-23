# apps/cafetera_hub/lib/cafetera_hub_web/router.ex
defmodule CafeteraHubWeb.Router do
  use CafeteraHubWeb, :router

  # Add bean routing
  pipeline :bean_api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  scope "/api/beans", CafeteraHubWeb do
    pipe_through :bean_api

    forward "/:bean_name", BeanController
  end
end
