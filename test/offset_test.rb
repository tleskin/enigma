require_relative 'test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    assert Offset
  end

  def test_it_takes_in_a_date
    offset = Offset.new
    assert_equal 6, offset.date.length
  end

  def test_it_squares_the_date_starting_with_zero
    offset = Offset.new
    assert_equal 918999225, offset.square("030315")
  end

  def test_it_squares_the_date_not_starting_with_zero
    offset = Offset.new
    assert_equal 14475699225, offset.square("120315")
  end

  def test_it_gets_rotation_a
    offset = Offset.new
    assert_equal [9], offset.rotation_a("918999225")
    assert_equal [9], offset.offset_values
  end

  def test_it_gets_rotation_b
    offset = Offset.new
    assert_equal [2], offset.rotation_b("918999225")
    assert_equal [2], offset.offset_values
  end

  def test_it_gets_rotation_c
    offset = Offset.new
    assert_equal [3], offset.rotation_c("918999235")
    assert_equal [3], offset.offset_values
  end

  def test_it_gets_rotation_d
    offset = Offset.new
    assert_equal [5], offset.rotation_d("918999225")
    assert_equal [5], offset.offset_values
  end

  def test_it_gets_returns_array_of_offsets_with_4_elements
    offset = Offset.new
    assert_equal 4, offset.return_offset.length
  end
4
end
