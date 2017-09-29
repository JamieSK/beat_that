class Player
  attr_accessor :last_roll, :wins
  attr_reader :name

  def initialize(name)
    @name = name
    @wins = 0
  end

  def roll_dice(die, number_of_dice)
    number_of_dice.times.each_with_object(array = []) { array << die.roll }
  end

  def high_number(array)
    array.sort.reverse.join.to_i
  end
end
