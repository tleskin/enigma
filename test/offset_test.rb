require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    assert Offset
  end

  def test_it_takes_in_a_date
    offset = Offset.new("030315")
    assert_equal "030315", offset.date
  end

  def test_it_gets_rotation_A
    offset = Offset.new("030315")
    assert_equal "03", offset.rotation_a
  end

end
