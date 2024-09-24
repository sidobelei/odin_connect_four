require_relative 'board'
require_relative 'player'

class Game
  attr_reader :players, :board
  
  def initialize
    @players = [
      Player.new('Player One', "\e[31mo\e[0m"), 
      Player.new('Player Two', "\e[33mo\e[0m")
    ]
    @board = Board.new
    @game_over = false
    @winner = nil
  end  
end