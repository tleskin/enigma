require './test/test_helper'
require './lib/rotator'

class RotatorTest < MiniTest::Test

  def test_it_exists
    assert Rotator
  end

  def test_it_generates_a_character_map
    rotator = Rotator.new
    assert_equal 39, rotator.character_map_generator.length
  end

  def test_it_rotates_a_character
    rotator = Rotator.new
    assert_equal "b", rotator.rotate_character("a", 1)
  end

  def test_it_rotates_a_space
    rotator = Rotator.new
    assert_equal "c", rotator.rotate_character(" ", 5)
  end

  def test_it_rotates_a_zero
    rotator = Rotator.new
    assert_equal ".", rotator.rotate_character("0", 11)
  end

  def test_it_rotates_a_comma
    rotator = Rotator.new
    assert_equal "b", rotator.rotate_character(",", 2)
  end

  def test_it_rotates_a_character_39_spaces
    rotator = Rotator.new
    assert_equal "a", rotator.rotate_character("a", 39)
  end

  def test_it_rotates_a_character_50_spaces
    rotator = Rotator.new
    assert_equal "l", rotator.rotate_character("a", 50)
  end

  def test_it_rotates_a_character_two_spaces_with_numbers_starting_with_zero
    rotator = Rotator.new
    assert_equal "c", rotator.rotate_character("a", 2)
  end

  def test_it_rotates_a_character_past_end_of_map_with_offset_starting_with_zero
    rotator = Rotator.new
    assert_equal "n", rotator.rotate_character(".", 15)
  end

  def test_it_decrypts_a_character
    rotator = Rotator.new
    assert_equal "z", rotator.decrypt_character("9", 10)
  end

  def test_it_decrypts_another_character
    rotator = Rotator.new
    assert_equal "j", rotator.decrypt_character("a", 30)
  end

  def test_it_decrypts_a_space
    rotator = Rotator.new
    assert_equal "z", rotator.decrypt_character(" ", 50)
  end

  def test_it_decrypts_a_number
    rotator = Rotator.new
    assert_equal "x", rotator.decrypt_character("4", 7)
  end

  def test_it_decrypts_something_else
    rotator = Rotator.new
    assert_equal "e", rotator.decrypt_character("1", 23)
  end







end
