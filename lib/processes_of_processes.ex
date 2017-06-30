defmodule ProcessesOfProcesses do
  use Application
  @moduledoc """
  Documentation for ProcessesOfProcesses.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ProcessesOfProcesses.hello
      :world

  """
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(ProcessesOfProcesses.Supervisor.Level1, []),
      supervisor(Task.Supervisor, [[name: ProcessesOfProcesses.Supervisor.Element.Level1]])
    ]
    Supervisor.start_link(children, [ strategy: :one_for_one ])
  end
end
