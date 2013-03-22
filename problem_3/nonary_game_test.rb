require 'test/unit'
require './nonary_game'

class NonaryGameTest < Test::Unit::TestCase

  SOLUTIONS = %w( 12357 12456 135 1458 15678 2358 2457 3456 34578 567 )
  
  def setup
    nonary_game = NonaryGame.new
    @solutions = nonary_game.valid_groups
  end
  
  def test_returns_an_array_of_solutions
    assert_kind_of Array, @solutions
  end
  
  def test_each_solution_is_an_array
    @solutions.each do |solution|
      assert_kind_of Array, solution
    end
  end
  
  def test_solutions_to_nonary_game
    sorted_solutions = @solutions.map { |sol| sol.sort.join }.sort

    assert_equal SOLUTIONS, sorted_solutions
  end

end
