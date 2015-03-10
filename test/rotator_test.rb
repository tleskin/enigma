require './test/test_helper'
require './lib/rotator'

class RotatorTest < MiniTest::Test

  def test_it_exists
    assert Rotator
  end

  def setup
    @rotator = Rotator.new
  end

  def test_it_generates_a_character_map
    assert_equal 39, @rotator.character_map_generator.length
  end

  def test_it_rotates_a_character
    assert_equal "b", @rotator.rotate_character("a", 1)
  end

  def test_it_rotates_a_space
    assert_equal "c", @rotator.rotate_character(" ", 5)
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
    assert_equal "c", @rotator.rotate_character("a", 2)
  end

  def test_it_rotates_a_character_past_end_of_map_with_offset_starting_with_zero
    assert_equal "n", @rotator.rotate_character(".", 15)
  end

  def test_it_decrypts_a_character
    assert_equal "z", @rotator.decrypt_character("9", 10)
  end

  def test_it_decrypts_another_character
    assert_equal "j", @rotator.decrypt_character("a", 30)
  end

  def test_it_decrypts_a_space
    assert_equal "z", @rotator.decrypt_character(" ", 50)
  end

  def test_it_decrypts_a_number
    assert_equal "x", @rotator.decrypt_character("4", 7)
  end

  def test_it_decrypts_something_else
    assert_equal "e", @rotator.decrypt_character("1", 23)
  end

  def test_it_decrypts_a_rotation_to_a_char_with_index_zero
    assert_equal "a", @rotator.decrypt_character("4", 30)
  end

  def test_it_decrypts_a_rotation_goes_off_edge_of_char_map
    assert_equal ",", @rotator.decrypt_character("e", 83)
  end

  def test_it_generates_letter_rotation_pairs
    assert_equal [["h", 2], ["e", 4], ["l", 6], ["l", 8], ["o", 10]],
    @rotator.generate_letter_rotation_pairs([2,4,6,8,10], 1, ["h", "e", "l", "l", "o"])
  end

  def test_it_calculates_total_rotation_from_key_and_offset
    assert_equal [2,4,6,8], @rotator.calculate_total_rotation([1,2,3,4], [1,2,3,4])
  end

  def test_it_finds_rotations_to_add_after_first_four_characters
    assert_equal 1, @rotator.rotations_to_add(["h", "e", "l", "l", "o"])
  end




end
