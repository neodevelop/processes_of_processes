defmodule ProcessesOfProcesses.Element.Level1 do

  def start_link do
    IO.puts "Some processes client"
    Agent.start_link(fn ->
      IO.puts "Some processes server"
      Process.sleep(3000)
      %{}
    end)
  end

end
