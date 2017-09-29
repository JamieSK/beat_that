require 'minitest/autorun'
require 'minitest/rg'

require_relative '../player'
require_relative '../die_six'

class TestPlayer < MiniTest::Test
  def setup
    @player = Player.new('Jamie')
    @die = DieSix.new
  end

  def test_roll_dice
    actual = @player.roll_dice(@die, 4)

    assert((1..6).cover?(actual[0]))
    assert((1..6).cover?(actual[1]))
    assert((1..6).cover?(actual[2]))
    assert((1..6).cover?(actual[3]))

    assert_equal(4, actual.length)
  end

  def test_high_number
    actual = @player.high_number([1, 3, 2, 4])
    expected = 4321

    assert_equal(expected, actual)
  end
end
