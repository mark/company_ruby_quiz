# blatantly ripped from:
#   https://raw.github.com/danoph/asplus_ruby_quiz/master/problem_3/nonary_game.rb
#
# As long as credit is given, there is no shame in using others code.
# I have more important things to focus on today.

class NonaryGame
  attr_reader :possibilities

  def initialize
    @possibilities = [1, 2, 3, 4, 5, 6, 7, 8]
  end

  def combo(length)
    possibilities.combination(length).to_a
  end

  def digital_root(numbers)
    if numbers.length > 1
      ints = numbers.inject(:+).to_s.chars.collect(&:to_i)
      digital_root(ints)
    else
      numbers.first
    end
  end

  def valid_groups
    combos = combo(3) + combo(4) + combo(5)

    combos.reject! { |i| !i.include?(5) }
    combos.reject! { |i| digital_root(i) != 9 }

    combos
  end
end
