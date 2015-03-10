require './test/test_helper'
require './lib/parser'

class ParserTest < Minitest::Test

  def setup
    @parser = Parser.new
  end

  def test_it_exists
    assert Parser
  end

  def test_it_reads_a_file
    saved_file = File.join(__dir__, "message.txt")
    assert_equal ["hello\n"], @parser.load(saved_file)
  end

end
