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
  
  def get_move(player)
    valid_move = false
    until valid_move
      print "Your turn #{player}: "
      move = gets.chomp
      move = move.to_i
      valid_move = board.valid_move?(move)
    end
    return move
  end
end