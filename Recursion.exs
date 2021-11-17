defmodule Recursion do
  def factorial(num) do
    case num do
      0 -> 1
      _ -> num * factorial(num - 1)
    end
  end

  def fibonacci(num) do
    cond do
      num == 0 -> 0
      num == 1 -> 1
      true -> fibonacci(num - 1) + fibonacci(num - 2)
    end
  end
end
