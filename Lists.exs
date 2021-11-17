defmodule Lists do
  def join(listA, listB) do
    listA ++ listB
  end

  def diff(listA, listB) do
    listA -- listB
  end
end

# Lists.diff([1,2], [3,4])
# [1, 2]

# Lists.diff([1,2], [1,3,4])
# [2]

defmodule MyList do
  def head([head | tail]) do
    head
  end

  def tail([head | tail]) do
    tail
  end

  def map([], _) do
    []
  end

  def map([head | tail], lambda) do
    cond do
      tail == [] -> [lambda.(head)]
      tail != [] -> [lambda.(head) | map(tail, lambda)]
    end
  end

  def map2([], _) do
    []
  end

  def map2(list, lambda) do
    case list do
      [head | []] -> [lambda.(head)]
      [head | tail] -> [lambda.(head) | map2(tail, lambda)]
    end
  end

  def sum([]) do
    []
  end

  def sum(list) do
    case list do
      [head | []] -> head
      [head | tail] -> head + sum(tail)
    end
  end

  def reduce([], _, _) do
    []
  end

  def reduce(list, seed, lambda) do
    case list do
      [head | []] -> lambda.(seed, head)
      [head | tail] -> reduce(tail, lambda.(seed, head), lambda)
    end
  end

  def sum2(list) do
    reduce(list, 0, fn x, y -> x + y end)
  end
end

# MyList.head [1,2,3]
# 1
# MyList.tail [1,2,3]
# [2, 3]
