defmodule ProcessesOfProcesses.Worker.Level1 do

  def start_link(id) do
    Agent.start_link fn -> {id , []} end
  end
end
