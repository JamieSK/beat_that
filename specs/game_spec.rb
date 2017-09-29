require 'minitest/autorun'
require 'minitest/rg'

require_relative '../game'
require_relative '../player'
require_relative '../die_six'

class TestGame < MiniTest::Test
  def setup
    @game = Game.new('Jamie', 'John Lennon', 4, 1)
  end

  def test_player_turn
    @game.player_turn
    assert(@game.last_roll > 0)
  end

  def test_players_rotate
    expected = @game.players.rotate
    @game.player_turn
    actual = @game.players

    assert_equal(expected, actual)
  end
end
