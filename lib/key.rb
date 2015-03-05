require 'pry'

class Key

  def initialize

  end
# generate a random 5 digit key, like 41521
# grab first two digits for "A" rotation (41)
# second and third digits are the "B" rotation (15)
# third and fourth digits are the "C" rotation (52)
# fourth and fifth digits are the "D" rotation (21)

  def generate_key
    numbers = (0..9).to_a
    Array.new(5){numbers.sample}
  end

  def rotation_a(key)
    a = key[0].to_s + key[1].to_s
    a.to_i
  end

  def rotation_b(key)
    a = key[1].to_s + key[2].to_s
    a.to_i
  end

  def rotation_c(key)
    a = key[2].to_s + key[3].to_s
    a.to_i
  end
  
  def rotation_d(key)
    a = key[3].to_s + key[4].to_s
    a.to_i
  end

end
