defmodule RockPaperScissorsTest do
  use ExUnit.Case

  describe "RockPaperScissors.calculate_total_score/1" do
    test "returns the total score based on shape played and round result" do
      input = """
      A Y
      B X
      C Z
      """

      assert RockPaperScissors.calculate_total_score(input) == 15
    end
  end
end
