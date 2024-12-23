defmodule Cafetera.Bean.Base do
  @moduledoc """
  Base behavior for Cafetera beans
  """

  defmodule Config do
    use TypedStruct

    typedstruct do
      field :name, String.t(), enforce: true
      field :version, Version.t()
      field :features, [atom()]
      field :dependencies, [String.t()]
      field :assets_path, String.t()
      field :migrations_path, String.t()
    end
  end

  @callback manifest() :: Config.t()
  @callback setup(context :: map()) :: {:ok, map()} | {:error, term()}
  @callback migrate() :: :ok | {:error, term()}
end
