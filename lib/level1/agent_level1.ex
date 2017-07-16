defmodule ProcessesOfProcesses.Worker.Level1 do

  def start_link(id) do
    Agent.start_link fn ->
      #Task.Supervisor.async(ProcessesOfProcesses.Supervisor.Element.Level1, fn ->
        IO.puts "Working."
        :timer.sleep(1500)
        IO.puts "Working.."
        :timer.sleep(1500)
        IO.puts "Working..."
        {id , []}
        #end)
    end
  end
end
