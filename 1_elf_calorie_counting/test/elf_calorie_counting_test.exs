defmodule ElfCalorieCountingTest do
  use ExUnit.Case

  describe "ElfCalorieCounting.elf_with_most_calories/1" do
    test "returns calorie count of the elf carrying most calories" do
      input = """
      1

      2
      2

      3
      3
      3

      4
      4
      4
      4
      """
      assert ElfCalorieCounting.elf_with_most_calories(input) == 16
    end
  end
end
