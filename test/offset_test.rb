require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    assert Offset
  end

  def test_it_takes_in_a_date
    offset = Offset.new
    assert_equal 6, offset.date.length
  end

  def test_it_squares_the_date
    offset = Offset.new
    assert_equal 918999225, offset.square("030315")
  end

  def test_it_gets_rotation_a
    offset = Offset.new
    assert_equal 9, offset.rotation_a("9225")
    assert_equal ({:a=>9}), offset.offset_values
  end

  def test_it_gets_rotation_b
    offset = Offset.new
    assert_equal 2, offset.rotation_b("9225")
    assert_equal ({:b=>2}), offset.offset_values
  end

  def test_it_gets_rotation_c
    offset = Offset.new
    assert_equal 3, offset.rotation_c("9235")
    assert_equal ({:c=>3}), offset.offset_values
  end

  def test_it_gets_rotation_d
    offset = Offset.new
    assert_equal 5, offset.rotation_d("9225")
    assert_equal ({:d=>5}), offset.offset_values
  end

end
