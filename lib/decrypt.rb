require_relative 'rotator'
require_relative 'offset'
require_relative 'key'
require_relative 'parser'
require_relative 'writer'
require 'pry'

parser = Parser.new
path = File.join(__dir__, ARGV[0])
parser.load(path)

message_to_decrypt = parser.message.split("")

key = Key.new(ARGV[2])
offset = Offset.new(ARGV[3])
rotator = Rotator.new

key_rotation = key.generate_key_rotations

offset_rotation = offset.return_offset

total_rotation = rotator.calculate_total_rotation(key_rotation, offset_rotation)

rotations_for_every_letter = rotator.rotations_to_add(message_to_decrypt)

pairs = rotator.generate_letter_rotation_pairs(total_rotation, rotations_for_every_letter, message_to_decrypt)
puts "#{pairs}"
decrypted_message = pairs.map do |pair|
  rotator.decrypt_character(pair[0], pair[1])
end
puts "#{decrypted_message}"
writer = FileWriter.new
saved_file = File.join(__dir__, ARGV[1])
writer.save(saved_file, decrypted_message.join)
puts "Created '#{ARGV[1]}' with key #{ARGV[2]} and date #{ARGV[3]}"
