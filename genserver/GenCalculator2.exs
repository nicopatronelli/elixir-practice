defmodule GenCalculator do
  use GenServer

  def add(pid, a, b) do
    GenServer.call(pid, {:add, a, b})
  end

  def subtract(pid, a, b) do
    GenServer.call(pid, {:subtract, a, b})
  end

  def multiply(pid, a, b) do
    GenServer.call(pid, {:multiply, a, b})
  end

  def divide(pid, a, b) do
    GenServer.call(pid, {:divide, a, b})
  end

  def reset(pid) do
    GenServer.cast(pid, {:reset})
  end

  def init(_param) do
    IO.puts "Init GenServer GenCalculator2"
    # count es una variable donde vamos a llevar la cuenta
    # de la cantidad de operaciones que la calculadora ha realizado
    {:ok, %{count: 0}}
  end

  def handle_call({operation, a, b}, _from, %{count: count}) do
    IO.puts "Computing #{operation} with operands #{a} and #{b}"
    case operation do
      :add -> {:reply, a + b, %{count: count + 1}}
      :subtract -> {:reply, a - b, %{count: count + 1}}
      :multiply -> {:reply, a * b, %{count: count + 1}}
      :divide -> {:reply, a / b, %{count: count + 1}}
    end
  end

  def handle_cast({:reset}, _state) do
    IO.puts "Reseting counter to zero ..."
    {:noreply, %{count: 0}}
  end
end
