require 'pry'

class Rotator

  def character_map_generator
    ('a'..'z').to_a + (0..9).to_a + [" ",".",","]
  end

  def rotate_character(letter, rotation, offset)
    grab_character = []
    character_map_generator.each_with_index do |character, index|
      if character == letter
        grab_character << character_map_generator[(index + rotation + offset) % 39]
      end
    end
    grab_character[0]
  end

end
