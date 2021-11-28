defmodule GenCalculator do
  use GenServer

  def start_link(_param) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_param) do
    IO.puts "Init GenServer GenCalculator"
    {:ok, nil}
  end

  def add(a, b) do
    GenServer.call(__MODULE__, {:add, a, b})
  end

  def subtract(a, b) do
    GenServer.call(__MODULE__, {:subtract, a, b})
  end

  def multiply(a, b) do
    GenServer.call(__MODULE__, {:multiply, a, b})
  end

  def divide(a, b) do
    GenServer.call(__MODULE__, {:divide, a, b})
  end

  def reset() do
    GenServer.cast(__MODULE__, {:reset})
  end

  def handle_call({operation, a, b}, _from, %{count: count}) do
    IO.puts "Computing #{operation} with operands #{a} and #{b}"
    case operation do
      :add ->
        {:reply, a + b, %{count: count + 1}}
      :subtract ->
        {:reply, a - b, %{count: count + 1}}
      :multiply ->
        {:reply, a * b, %{count: count + 1}}
      :divide ->
        {:reply, a / b, %{count: count + 1}}
    end
  end

  def handle_cast({:reset}, _state) do
    IO.puts "Reseting counter to zero ..."
    {:noreply, %{count: 0}}
  end

  def handle_info(:timeout, state) do
    IO.puts "Calling handle_info with message timeout"
    {:noreply, state}
  end
end
