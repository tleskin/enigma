require_relative 'rotator'
require_relative 'offset'
require_relative 'key'
require_relative 'writer'
require_relative 'parser'
require 'pry'

parser = Parser.new
path = File.join(__dir__, ARGV[0])
parser.load(path)

message_to_encrypt = parser.message.split("")

key = Key.new
offset = Offset.new
rotator = Rotator.new

key_rotation = key.generate_key_rotations

offset_rotation = offset.return_offset

total_rotation = rotator.calculate_total_rotation(key_rotation, offset_rotation)

rotations_for_every_letter = rotator.rotations_to_add(message_to_encrypt)

pairs = rotator.generate_letter_rotation_pairs(total_rotation, rotations_for_every_letter, message_to_encrypt)


encrypted_message = pairs.map do |pair|
  rotator.rotate_character(pair[0], pair[1])
end

fw = FileWriter.new
saved_file = File.join(__dir__, ARGV[1])
fw.save(saved_file, encrypted_message.join)
puts "Created #{ARGV[1]} with key #{key.key.join} and date #{offset.date}"
