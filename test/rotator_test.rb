require './test/test_helper'
require './lib/rotator'

class RotatorTest < MiniTest::Test

  def test_it_exists
    assert Rotator
  end

  def test_it_generates_a_character_map
    rotator = Rotator.new
    assert_equal (["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",0,1,2,3,4,5,6,
      7, 8, 9," ",".",","]), rotator.character_map_generator
  end

  def test_it_rotates_a_character
    rotator = Rotator.new
    assert_equal "v", rotator.rotate_character("a", 12, 9)
  end

  def test_it_rotates_a_space
    rotator = Rotator.new
    assert_equal "c", rotator.rotate_character(" ", 3, 2)
  end

  def test_it_rotates_a_zero
    rotator = Rotator.new
    assert_equal ".", rotator.rotate_character(0, 5, 6)
  end

  def test_it_rotates_a_comma
    rotator = Rotator.new
    assert_equal "b", rotator.rotate_character(",", 1, 1)
  end

  def test_it_rotates_a_character_39_spaces
    rotator = Rotator.new
    assert_equal "a", rotator.rotate_character("a", 30, 9)
  end

  def test_it_rotates_a_character_50_spaces
    rotator = Rotator.new
    assert_equal "l", rotator.rotate_character("a", 30, 20)
  end

  def test_it_rotates_a_character_two_spaces_with_numbers_starting_with_zero
    rotator = Rotator.new
    assert_equal "c", rotator.rotate_character("a", 01, 01)
  end

  def test_it_rotates_a_character_past_end_of_map_with_offset_starting_with_zero
    rotator = Rotator.new
    assert_equal "n", rotator.rotate_character(".", 10, 05)
  end


  def test_it_rotates_a_character_past_end_of_map_with_key_rotation_starting_with_zero
    rotator = Rotator.new
    assert_equal "n", rotator.rotate_character(".", 05, 10)
  end

end
