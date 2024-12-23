defmodule Cafetera.Bean.Manager do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    {:ok, %{beans: %{}, features: %{}}}
  end

  def register_bean(bean) do
    GenServer.call(__MODULE__, {:register, bean})
  end

  def get_bean(name) do
    GenServer.call(__MODULE__, {:get, name})
  end

  def handle_call({:register, bean}, _from, state) do
    new_state = put_in(state.beans[bean.name], bean)
    {:reply, :ok, new_state}
  end
end
