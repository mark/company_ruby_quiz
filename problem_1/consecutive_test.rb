require 'test/unit'
require './consecutive'

class ConsecutiveTest < Test::Unit::TestCase

  def test_max_consecutive_characters_should_return_an_array
    c = Consecutive.new "aaddddffffaa"
    assert_kind_of Array, c.max_consecutive_characters
  end
  
  def test_cat_dog___
    c = Consecutive.new "cat dog ___"
    assert_equal %w(_), c.max_consecutive_characters
  end

  def test_aabbaabbbaa
    c = Consecutive.new "aabbaabbbaa"
    assert_equal %w(b), c.max_consecutive_characters
  end

  def test_aabaa
    c = Consecutive.new "aabaa"
    assert_equal %w(a), c.max_consecutive_characters
  end  	

  def test_aaddddffffaa
    c = Consecutive.new "aaddddffffaa"
    assert_equal %w(d f), c.max_consecutive_characters
  end
  
  def test_sort_order
    c = Consecutive.new "bbaa"
    assert_equal %w(a b), c.max_consecutive_characters
  end
  
  def test_not_highest_letter_most_common
    c = Consecutive.new "aaaaaaaaaaaaaaaaaaaaaaaaaaaazbb"
    assert_equal %w(a), c.max_consecutive_characters
  end

  def test_multiple_character_instances
    c = Consecutive.new "aaabba"
    assert_equal %w(a), c.max_consecutive_characters
  end
  
end
