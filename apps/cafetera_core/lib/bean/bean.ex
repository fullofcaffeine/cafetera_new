defmodule Cafetera.Bean do
  use TypedStruct

  typedstruct do
    field :name, String.t(), enforce: true
    field :version, Version.t()
    field :features, [atom()]
    field :api_routes, [api_route()]
    field :infrastructure, infrastructure()
  end

  @type api_route :: %{
    path: String.t(),
    method: :get | :post | :put | :delete,
    handler: {module(), atom()}
  }

  @type infrastructure :: %{
    requires: [String.t()],
    provides: [String.t()],
    resources: [resource()]
  }

  @type resource :: %{
    type: :container | :vm | :service,
    spec: map()
  }
end
