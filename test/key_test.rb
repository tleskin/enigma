require './test/test_helper'
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
    key.generate_key_rotations
    assert key.key_rotation[0]
  end

  def test_it_grabs_rotation_b
    key = Key.new
    key.generate_key_rotations
    assert key.key_rotation[1]
  end

  def test_it_grabs_rotation_c
    key = Key.new
    key.generate_key_rotations
    assert key.key_rotation[2]
  end

  def test_it_grabs_rotation_d
    key = Key.new
    key.generate_key_rotations
    assert key.key_rotation[3]
  end
end
