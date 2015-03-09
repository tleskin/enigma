require 'pry'

class Key

  attr_accessor :key_rotation, :key

  def initialize(key = generate_key)
    @key_rotation = []
    @key = key
  end

  def generate_key
    key = []
    5.times do
      key << rand(0..9)
    end
    key
  end

  def generate_key_rotations
    @key
    n = 0
    4.times do
     @key_rotation << (@key[n].to_s + @key[n+1].to_s).to_i
     n += 1
    end
    @key_rotation
  end

end
