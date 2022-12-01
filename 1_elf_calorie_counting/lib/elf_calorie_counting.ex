defmodule ElfCalorieCounting do
  def elf_with_most_calories(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(&sum_calories/1)
    |> Enum.sort(&(&1 >= &2))
    |> List.first
  end

  defp sum_calories(input) do
    input
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
  end
end
