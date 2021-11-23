# Proceso que 'recuerda' el valor de un contador
defmodule State do
  def counter(value) do
    receive do
      {:get, pid} ->
        send(pid, value)
        counter(value)
      :inc -> counter(value + 1)
      :dec -> counter(value - 1)
      :reset -> counter(0)
    end
  end
end
