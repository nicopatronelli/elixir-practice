defmodule GenCalculator do
  use GenServer

  def init(param) do
    # IO.puts "Init GenServer GenCalculator with #{param}"
    {:ok, %{count: 0}}
    # {:stop, "GenCalculator could not be started"}
  end
  
  def handle_call({:add, a, b}, _from, %{count: count}) do
    IO.puts "handle_call(:add, #{a}, #{b})"
    Process.sleep(6000)
    {:reply, a + b, %{count: count + 1}}
  end

  def handle_cast({:reset}, _state) do
    IO.puts "handle_cast(:reset)"
    {:noreply, %{count: 0}}
  end

  def handle_info(msg, %{count: count_value}) do
    IO.puts "This process was called #{count_value} times"
    {:noreply, %{count: count_value + 1}}
  end
end
