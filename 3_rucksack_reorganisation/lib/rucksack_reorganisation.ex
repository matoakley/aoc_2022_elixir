defmodule RucksackReorganisation do
  def sum_priority_of_misplaced_types(input) do
    input
    |> String.trim
    |> String.split("\n")
    # split into compartments
    |> Enum.map(fn items ->
      compartment_size = String.length(items) |> Kernel.div(2)

      {
        String.slice(items, 0..compartment_size - 1),
        String.slice(items, (compartment_size)..-1)
      }
    end)
    # find the common letter
    |> Enum.map(fn { first_compartment, second_compartment } = _bag_contents ->
      first_compartment
      |> String.graphemes()
      |> Enum.find(fn char -> String.contains?(second_compartment, char) end)
    end)
    # calculate priority
    |> Enum.map(fn char ->
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      |> String.graphemes()
      |> Enum.find_index(&(&1==char))
      |> Kernel.+(1)
    end)
    |> Enum.sum()
  end
end
