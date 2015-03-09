require 'pry'

class Rotator

  def character_map_generator
    ('a'..'z').to_a + ("0".."9").to_a + [" ",".",","]
  end

  def rotate_character(letter, rotation)
    grab_character = []
    character_map_generator.each_with_index do |character, index|
      if character == letter
        grab_character << character_map_generator[(index + rotation) % 39]
      end
    end
    grab_character[0]
  end

  def calculate_total_rotation(key_rotation, offset_rotation)
    total_rotation = key_rotation.zip(offset_rotation).map{|pair|
      pair.reduce(&:+) }
  end

  def rotations_to_add(message)
    message.length - 4
  end

  def generate_letter_rotation_pairs(total_rotation, rotations_to_add, message)
    i = 0
    rotations_to_add.times do
      total_rotation << total_rotation[i % 4]
      i+=1
    end
    message.zip(total_rotation)
  end

  def decrypt_character(letter, rotation)
    grab_character = []
    character_map_generator.each_with_index do |character, index|
      if character == letter
        new_rot = rotation - index
        if new_rot <= 0
          grab_character << character_map_generator[new_rot.abs]
        else
          grab_character << character_map_generator[(39 - new_rot.abs) % 39]
        end
      end
    end
    grab_character[0]
  end


end
