# Compile a file from shell:
# elixirc <file_name>
# It generates a Elixir.<file_name>.beam file (a binary file)
defmodule HelloWorld do
  def sayHello(name) do
    IO.puts("Hello #{name}! How are you been?")
  end
end

HelloWorld.sayHello("Nico")
