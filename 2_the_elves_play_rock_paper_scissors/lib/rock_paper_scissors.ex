defmodule RockPaperScissors do
  def calculate_total_score(input) do
    input
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn round -> String.split(round) end)
    |> Enum.reduce(0, fn [their_shape, your_shape], acc ->
      [acc, shape_score(your_shape), round_score(their_shape, your_shape)]
      |> Enum.sum
    end)
  end

  defp shape_score("X"), do: 1
  defp shape_score("Y"), do: 2
  defp shape_score("Z"), do: 3

  defp round_score("A", "Y"), do: 6
  defp round_score("B", "Z"), do: 6
  defp round_score("C", "X"), do: 6

  defp round_score("A", "X"), do: 3
  defp round_score("B", "Y"), do: 3
  defp round_score("C", "Z"), do: 3

  defp round_score(_,_), do: 0
end
