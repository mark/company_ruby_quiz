require 'test/unit'
require 'nonary_game'

class NonaryGameTest < Test::Unit::TestCase

  SOLUTIONS = %w( 12357 12456 135 1458 15678 2358 2457 3456 34578 567 )
  
  def test_solutions_to_nonary_game
    nonary_game = NonaryGame.new
    solutions = nonary_game.valid_groups
    sorted_solutions = solutions.map { |sol| sol.sort.join }.sort

    assert_equal SOLUTIONS, sorted_solutions
  end

end
