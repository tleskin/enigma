require './test/test_helper'
require './lib/writer'

class WriterTest < Minitest::Test

  def setup
    @writer = FileWriter.new
  end

  def test_it_exists
    assert FileWriter
  end

  def test_it_writes_to_a_file
    saved_file = File.join(__dir__, "message.txt")
    assert_equal nil, @writer.save(saved_file, "hello")
  end

end
