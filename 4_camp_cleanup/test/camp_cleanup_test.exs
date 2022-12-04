defmodule CampCleanupTest do
  use ExUnit.Case

  describe "CampCleanup.containing_section_count/1" do
    test "returns a count of pairs where one is fully contained in the other" do
      input = """
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
      """
      assert CampCleanup.containing_section_count(input) == 2
    end
  end

  describe "CampCleanup.overlapping_section_count/1" do
    test "returns a count of pairs where there is overlap" do
      input = """
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
      """
      assert CampCleanup.overlapping_section_count(input) == 4
    end
  end
end
