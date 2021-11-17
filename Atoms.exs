defmodule Atoms do
  def evolution(pokemon) do
    case pokemon do
      :pikachu -> :raichu
      :charmander -> :charmeleon
      :snorlax -> :none
      :mew -> :mewtwo
      _ -> nil
    end
  end
end
