defmodule RucksackReorganisation do
  def sum_priority_of_misplaced_types(input) do
    input
    |> String.split("\n", trim: true)
    # split into compartments
    |> Enum.map(fn items ->
      items |> String.to_charlist() |> Enum.split(div(String.length(items), 2))
    end)
    |> Enum.map(fn { first_compartment, second_compartment } ->
      first_compartment
      |> Enum.find(fn char -> Enum.find(second_compartment, &(&1==char)) end)
    end)
    |> calculate_priority()
    |> Enum.sum
  end

  def sum_priority_of_group_badges(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(fn group -> Enum.map(group, &String.to_charlist/1) end)
    # find the common letter
    |> Enum.map(fn [first_elf, second_elf, third_elf] ->
      first_elf
      |> Enum.filter(fn char -> Enum.find(second_elf, &(&1==char)) end)
      |> Enum.find(fn char -> Enum.find(third_elf, &(&1==char)) end)
    end)
    |> calculate_priority()
    |> Enum.sum()
  end

  defp calculate_priority(chars) do
    chars
    |> Enum.map(fn char ->
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
      |> Enum.find_index(&(&1==char))
      |> Kernel.+(1)
    end)
  end
end
