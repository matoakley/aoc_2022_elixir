defmodule RockPaperScissorsTest do
  use ExUnit.Case

  describe "RockPaperScissors.total_score/1" do
    test "returns the total score based on shape played and round result" do
      input = """
      A Y
      B X
      C Z
      """

      assert RockPaperScissors.total_score(input) == 15
    end
  end

  describe "RockPaperScissors.total_score_with_strategy_guide/1" do
    test "returns the total score based on shape played and round result" do
      input = """
      A Y
      B X
      C Z
      """

      assert RockPaperScissors.total_score_with_strategy_guide(input) == 12
    end
  end
end
