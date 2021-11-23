defmodule Calculator do
  def compute() do
    receive do
      {pid, :+, a, b} -> send(pid, a + b)
      {pid, :-, a, b} -> send(pid, a - b)
      {pid, :x, a, b} -> send(pid, a * b)
      {_pid, :/, _a, 0} -> exit("Can't divide by zero. Exiting ...")
      {pid, :/, a, b} -> send(pid, a / b)
    end
    compute()
  end
end
