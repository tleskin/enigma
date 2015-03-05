require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    assert Key
  end

  def test_it_generates_a_random_5_digit_key
    key = Key.new
    assert_equal 5, key.generate_key.length
  end

  def test_it_grabs_rotation_a
    key = Key.new
    assert_equal 12, key.rotation_a([1,2,3,4,5])
  end

  def test_it_grabs_rotation_a
    key = Key.new
    assert_equal 02, key.rotation_a([0,2,3,4,5])
  end

  def test_it_grabs_rotation_b
    key = Key.new
    assert_equal 23, key.rotation_b([1,2,3,4,5])
  end

  def test_it_grabs_rotation_c
    key = Key.new
    assert_equal 34, key.rotation_c([1,2,3,4,5])
  end

  def test_it_grabs_rotation_d
    key = Key.new
    assert_equal 45, key.rotation_d([1,2,3,4,5])
  end
end
