defmodule CafeteraHub.Beans.Loader do
  @moduledoc """
  Manages bean loading and initialization
  """

  def load_beans do
    Application.get_env(:cafetera_hub, :beans, [])
    |> Enum.map(&load_bean/1)
  end

  defp load_bean(bean_module) do
    with {:ok, config} <- validate_bean(bean_module),
         :ok <- copy_assets(config),
         :ok <- run_migrations(config) do
      {:ok, config}
    end
  end
end
