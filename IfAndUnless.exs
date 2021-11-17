defmodule IfAndUnless do
  def onlyFirePokemons({name, type}) do
    if type == "fire" do
      IO.puts("You can pass #{name}")
    else
      IO.puts("Get out!")
    end
  end

  def canDefeatCharizard({type, level}) do
    unless type == "water" and level >= 50 do
      IO.puts("You never could defeat a Charizard")
    else
      IO.puts("Ohh ... you are powerful!")
    end
  end
end

IfAndUnless.onlyFirePokemons({"pikachu", "electric"})
# iex(32)> IfAndUnless.onlyFirePokemons({"pikachu", "electric"})
# Get out!
# :ok

IfAndUnless.onlyFirePokemons({"charmander", "fire"})
# iex(33)> IfAndUnless.onlyFirePokemons({"charmander", "fire"})
# You can pass charmander
# :ok

IfAndUnless.canDefeatCharizard({"water", 25})
# You never could defeat a Charizard
# :ok

IfAndUnless.canDefeatCharizard({"water", 55})
# Ohh ... you are powerful!
# :ok
