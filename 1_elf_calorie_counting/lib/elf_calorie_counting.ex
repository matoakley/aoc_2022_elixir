defmodule ElfCalorieCounting do
  def elf_with_most_calories(input), do: total_calories_for_top_n_elves(input, 1)
  def total_calories_of_top_three_elves(input), do: total_calories_for_top_n_elves(input, 3)

  def total_calories_for_top_n_elves(input, n) do
    input
    |> String.split("\n\n")
    |> Enum.map(&sum_calories/1)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(n)
    |> Enum.sum
  end

  defp sum_calories(input) do
    input
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
  end
end
