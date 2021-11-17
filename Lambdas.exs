defmodule Lambdas do
  def multiplyByTwo(number) do
    multiplyByTwo = fn x -> x * 2 end
    # lambda.(param)
    result = multiplyByTwo.(number)
    IO.puts("Multiply #{number} by two is equals to #{result}")
  end

  def applyTo(lambda, number) do
    result = lambda.(number)
    IO.puts("The result is #{result}")
  end

  # iex(4)> Lambdas.applyTo(fn x -> x * 2 end, 4)
  # The result is 8
  # :ok
end
