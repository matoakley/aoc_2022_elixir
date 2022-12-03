defmodule RucksackReorganisationTest do
  use ExUnit.Case

  describe "RucksackReorganisation.sum_priority_of_misplaced_types/1" do
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

  describe "RucksackReorganisation.sum_priority_of_group_badges/1" do
    test "returns an integer value" do
      input = """
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
      """

      assert RucksackReorganisation.sum_priority_of_group_badges(input) == 70
    end
  end
end
