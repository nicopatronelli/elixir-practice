defmodule HelloWorldProcess do
  def sayHello(name) do
    spawn(
      HelloWorldProcess,
      IO.puts("Hello #{name}! How are you been?"),
      [name]
    )
  end
end
