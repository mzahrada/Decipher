$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'decipher/runner'

class RunnerTest < Test::Unit::TestCase
  def test_run_param_error
    assert_raise(ArgumentError) { Decipher::Runner.new([]) }
  end

  def test_file_not_found
    assert_raise(IOError) { Decipher::Runner.new(["none.txt"]) }
  end
end
