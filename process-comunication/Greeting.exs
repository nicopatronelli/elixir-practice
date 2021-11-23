# Este proceso está a la escucha de mensajes
defmodule Greeting do
  def sayHello1 do
    # keyword para recibir mensajes (bloqueante hara recibir un mensaje)
    # Mira en la bandeja de entrada del proceso y lee el próximo mensaje
    receive do
      name -> IO.puts "Hello #{name}!"
    end
    sayHello()
  end

  # Recibe el mensaje {pid, name} y le envía el mensaje "Hello #{name}!"
  # al proceso emisor (que luego deberá leerlo con un receive)
  def sayHello do
    receive do
      {pid, name} -> send(pid, "Hello #{name}!")
    end
    sayHello()
  end
end
