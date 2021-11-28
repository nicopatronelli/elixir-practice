# GenCalculator with timeouts
defmodule GenCalculator do
  use GenServer

  # module constants
  @timeout 2000 # Max time we wait for an operation to be completed
  @fast_operation_time 1000
  @expensive_operation_time 6000

  def add(pid, a, b) do
    GenServer.call(pid, {:add, a, b}, @timeout)
  end

  def subtract(pid, a, b) do
    GenServer.call(pid, {:subtract, a, b}, @timeout)
  end

  def multiply(pid, a, b) do
    GenServer.call(pid, {:multiply, a, b}, @timeout)
  end

  def divide(pid, a, b) do
    GenServer.call(pid, {:divide, a, b}, @timeout)
  end

  def reset(pid) do
    GenServer.cast(pid, {:reset})
  end

  def init(_param) do
    IO.puts "Init GenServer GenCalculator"
    # count es una variable donde vamos a llevar la cuenta
    # de la cantidad de operaciones que la calculadora ha realizado
    {:ok, %{count: 0}}
  end

  def handle_call({operation, a, b}, _from, %{count: count}) do
    IO.puts "Computing #{operation} with operands #{a} and #{b}"
    case operation do
      :add ->
        compute_fast_operation()
        {:reply, a + b, %{count: count + 1}}
      :subtract ->
        compute_fast_operation()
        {:reply, a - b, %{count: count + 1}}
      :multiply ->
        compute_fast_operation()
        {:reply, a * b, %{count: count + 1}}
      :divide ->
        compute_expensive_operation()
        {:reply, a / b, %{count: count + 1}}
    end
  end

  defp compute_fast_operation do
    Process.sleep(@fast_operation_time)
  end

  defp compute_expensive_operation do
    Process.sleep(@expensive_operation_time)
  end

  def handle_cast({:reset}, _state) do
    IO.puts "Reseting counter to zero ..."
    {:noreply, %{count: 0}}
  end

  def handle_info(msg, state) do
    IO.puts "Calling handle_info with message #{msg}"
    {:noreply, state}
  end
end
