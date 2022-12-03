defmodule RucksackReorganisationTest do
  use ExUnit.Case

  describe "RucksackReorganisation.sum_priority_misplaced_types/1" do
    test "returns an integer value" do
      input = """
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
      """

      assert RucksackReorganisation.sum_priority_of_misplaced_types(input) == 157
    end
  end
end
