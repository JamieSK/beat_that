require 'pry-byebug'

require_relative 'game'
require_relative 'player'
require_relative 'die_six'
require_relative 'ui'

class Game
  attr_reader :last_roll, :players, :won

  def initialize(player1, player2, dice_num, rounds)
    @players = [Player.new(player1), Player.new(player2)]
    @die = DieSix.new
    @ui = UI.new
    @dice_num = dice_num
    @rounds = rounds
    @last_roll = 0
    @won = false
  end

  def player_turn
    player = @players[0]
    player_roll = player.high_number(player.roll_dice(@die, @dice_num))

    if loss?(player_roll)
      @won = true
      @ui.player_roll(player.name, player_roll)
      @ui.winner_winner(@players[1].name)
    else
      @last_roll = player_roll
      @players.rotate!
      @ui.player_roll(player.name, player_roll)
    end
  end

  def loss?(player_roll)
    player_roll < @last_roll
  end

end

game = Game.new('Jamie', 'John Lennon', 4, 0)

def lets_play(game)
  until game.won
    # binding.pry
    game.player_turn
  end
end
lets_play(game)
