require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    assert Key
  end
end
