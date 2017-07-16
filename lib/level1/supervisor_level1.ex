defmodule ProcessesOfProcesses.Supervisor.Level1 do
  use Supervisor

  ## Supervisor API

  def new_process do
    Task.Supervisor.async(ProcessesOfProcesses.Supervisor.Element.Level1, fn ->
      Supervisor.start_child __MODULE__, [:os.system_time(:millisecond)]
    end)
  end

  ## Supervisor callbacks

  def start_link() do
    Supervisor.start_link __MODULE__, :ok, name: __MODULE__
  end

  def init(:ok) do
    children = [
      worker(ProcessesOfProcesses.Element.Level1, [])
    ]
    supervise(children, [ strategy: :simple_one_for_one ])
  end
end
