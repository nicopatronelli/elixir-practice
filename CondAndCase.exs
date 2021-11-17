defmodule Pokemon do
  def evolution(pokemon) do
    cond do
      pokemon == "pikachu" -> "raichu"
      pokemon == "charmander" -> "charmeleon"
      pokemon == "mew" -> "mewtwo"
      true -> "unknown"
    end
  end

  def number(name) do
    case name do
      "charmander" -> 4
      "pikachu" -> 25
      "raichu" -> 26
      _ -> 0
    end
  end
end
