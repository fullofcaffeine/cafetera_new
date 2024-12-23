# beans/crm_bean/lib/crm_bean.ex
defmodule Cafetera.Beans.CRM do
  use Cafetera.Bean.Base

  def manifest do
    %Base.Config{
      name: "crm",
      version: Version.parse!("1.0.0"),
      features: [:contacts, :leads, :campaigns],
      dependencies: ["auth"],
      assets_path: Path.join(__DIR__, "../priv/assets"),
      migrations_path: Path.join(__DIR__, "../priv/migrations")
    }
  end

  def setup(context) do
    with {:ok, _} <- setup_mautic(context),
         {:ok, _} <- setup_connectors(context) do
      {:ok, context}
    end
  end

  def migrate do
    :ok
  end

  # API Integration
  def routes do
    [
      %{
        path: "/api/crm/leads",
        method: :post,
        handler: {__MODULE__, :create_lead}
      },
      %{
        path: "/api/crm/campaigns",
        method: :get,
        handler: {__MODULE__, :list_campaigns}
      }
    ]
  end

  # Infrastructure Spec
  def infrastructure do
    %{
      requires: ["postgresql"],
      provides: ["crm_api"],
      resources: [
        %{
          type: :container,
          name: "mautic",
          spec: %{
            image: "mautic/mautic:latest",
            ports: [80],
            env: [
              "MAUTIC_DB_HOST=postgres",
              "MAUTIC_DB_USER=postgres"
            ]
          }
        }
      ]
    }
  end

  # Private Functions
  defp setup_mautic(context) do
    # Setup Mautic instance
    {:ok, context}
  end

  defp setup_connectors(context) do
    # Setup data sync
    {:ok, context}
  end
end
