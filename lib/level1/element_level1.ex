defmodule ProcessesOfProcesses.Element.Level1 do

  # GenServer Client API

  # GenServer callbacks

  def start_link(id, opts \\ []) do
    GenServer.start_link __MODULE__, id, opts
  end

  def init(id) do
    {:ok, %{id: id}}
  end

end
