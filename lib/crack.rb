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
@decrypted_message = message_to_decrypt.join

until @decrypted_message[-7..-1] == "..end.."

  key = Key.new

  offset = Offset.new(ARGV[2])

  rotator = Rotator.new

  key_rotation = key.generate_key_rotations

  offset_rotation = offset.return_offset

  total_rotation = rotator.calculate_total_rotation(key_rotation, offset_rotation)

  all_rots = rotator.rotations_to_add(message_to_decrypt)

  pairs = rotator.generate_letter_rotation_pairs(total_rotation, all_rots, message_to_decrypt)

  new_message = pairs.map do |pair|
    rotator.decrypt_character(pair[0], pair[1])
  end

  @decrypted_message = new_message.join
end

writer = FileWriter.new
saved_file = File.join(__dir__, ARGV[1])
writer.save(saved_file, @decrypted_message)
puts "Created '#{ARGV[1]}' with key #{key.key.join} and date #{ARGV[2]}"
