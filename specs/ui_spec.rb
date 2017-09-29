require 'minitest/autorun'
require 'minitest/rg'

require_relative '../ui'

class TestUI < MiniTest::Test
  def setup
    @ui = UI.new
  end


end
