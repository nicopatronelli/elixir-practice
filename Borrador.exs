defmodule Borrador do
  def apply(lambda, v) do
    lambda.(v)
  end

  def sum(a, b) do
    a + b
  end
end

defmodule Calculator do
  def sum(a, b) do
    a + b
  end
end
