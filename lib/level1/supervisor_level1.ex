defmodule ProcessesOfProcesses.Supervisor.Level1 do
  use Supervisor

  def start_link do
    Supervisor.start_link __MODULE__, :ok, name: __MODULE__
  end

  def start_child do
    Task.Supervisor.start_child(ProcessesOfProcesses.Supervisor.Element.Level1, fn ->
      Supervisor.start_child __MODULE__, []
    end)
  end

  def init(:ok) do
    children = [
      worker(ProcessesOfProcesses.Element.Level1, [])
    ]
    supervise(children, [ strategy: :simple_one_for_one ])
  end
end
