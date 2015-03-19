class Consecutive

  def initialize(string)
    @input_string = string
    @consecutive_counts = {}
    count_consecutive_characters
  end

  # :call-seq:
  # max_consecutive_characters
  #
  # determins largest counts

  def max_consecutive_characters
    most_consecutive = @consecutive_counts.keys.max

    # NOTE: spec ignores duplicated consecutives, therefore unique is required
    # e.g. 'aabbaa' will have 2 counts for a and 1 for b
    @consecutive_counts[most_consecutive].uniq.sort
  end

  private

  # :call-seq:
  # count_consecutive_characters
  #
  # counts consecutive characters, storing results in @consecutive_counts

  def count_consecutive_characters
    consecutive_match = @input_string.scan(/((.)\2{1,})/)

    consecutive_match.each do |found|
      @consecutive_counts[found[0].length] ||= []
      @consecutive_counts[found[0].length].push found[1]
    end
  end
end
