defmodule EnumPrac do
  def sum(list) do
    Enum.sum(list)
  end

  # > EnumPrac.filter([1,2,3], fn x -> x > 2 end)
  # [3]
  def filter(list, predicate) do
    Enum.filter(list, predicate)
  end

  def sum2(list) do
    Enum.reduce(list, 0, fn x, y -> x + y end)
  end
end
