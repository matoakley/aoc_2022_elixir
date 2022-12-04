defmodule CampCleanup do
  def containing_section_count(input) do
    input
    |> range_pairs_as_mapsets()
    |> Enum.count(fn [first_section, second_section] ->
      MapSet.subset?(first_section, second_section) ||
        MapSet.subset?(second_section, first_section)
    end)
  end

  def overlapping_section_count(input) do
    input
    |> range_pairs_as_mapsets()
    |> Enum.count(fn [first_section, second_section] ->
      MapSet.intersection(first_section, second_section)
      |> Enum.any?
    end)
  end

  defp range_pairs_as_mapsets(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(fn [first_section, second_section] ->
      [
        MapSet.new(section_label_to_range(first_section)),
        MapSet.new(section_label_to_range(second_section))
      ]
    end)
  end

  defp section_label_to_range(label) do
    label
    |> String.split("-")
    |> then(fn [from_section, to_section] ->
      Range.new(String.to_integer(from_section), String.to_integer(to_section))
    end)
  end
end
