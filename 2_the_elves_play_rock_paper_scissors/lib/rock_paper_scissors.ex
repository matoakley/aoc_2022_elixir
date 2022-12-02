defmodule RockPaperScissors do
  def total_score(input), do: calculate_total_score(input)
  def total_score_with_strategy_guide(input), do: calculate_total_score(input, true)

  defp calculate_total_score(input, with_strategy_guide \\ false) do
    input
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&maybe_implement_strategy_guide(&1, with_strategy_guide))
    |> Enum.reduce(0, &sum_round_scores/2)
  end

  defp sum_round_scores([their_shape, your_shape], acc) do
    acc
    |> Kernel.+(shape_score(your_shape))
    |> Kernel.+(round_score(their_shape, your_shape))
  end

  defp maybe_implement_strategy_guide(input, false), do: input
  defp maybe_implement_strategy_guide([their_shape, desired_result], true) do
    [their_shape]
    |> List.insert_at(1, shape_for_result(their_shape, desired_result))
  end

  defp shape_for_result("A", "X"), do: "C"
  defp shape_for_result("A", "Z"), do: "B"
  defp shape_for_result("B", "X"), do: "A"
  defp shape_for_result("B", "Z"), do: "C"
  defp shape_for_result("C", "X"), do: "B"
  defp shape_for_result("C", "Z"), do: "A"
  defp shape_for_result(their_shape, "Y"), do: their_shape

  defp shape_score(shape) when shape in ["A", "X"], do: 1
  defp shape_score(shape) when shape in ["B", "Y"], do: 2
  defp shape_score(shape) when shape in ["C", "Z"], do: 3

  defp round_score("A", your_shape) when your_shape in ["B", "Y"], do: 6
  defp round_score("B", your_shape) when your_shape in ["C", "Z"], do: 6
  defp round_score("C", your_shape) when your_shape in ["A", "X"], do: 6
  defp round_score("A", your_shape) when your_shape in ["A", "X"], do: 3
  defp round_score("B", your_shape) when your_shape in ["B", "Y"], do: 3
  defp round_score("C", your_shape) when your_shape in ["C", "Z"], do: 3
  defp round_score(_,_), do: 0
end
