require_relative 'board'
require_relative 'player'

class Game
  attr_reader :players, :board 
  attr_accessor :winner, :game_over

  def initialize
    @players = [
      Player.new('Player One', "\e[31mo\e[0m"), 
      Player.new('Player Two', "\e[33mo\e[0m")
    ]
    @board = Board.new
    @game_over = false
    @winner = nil
  end

  def play_game 
    until game_over
      players.each do |player|
          puts board
          move = get_move(player.name)
          board.update(move, player.game_piece)
          if board.four_in_a_row?(player.game_piece)      
              @game_over = true
              @winner = player.name
              break
          elsif board.full?    
              @game_over = true
              break
          end
      end
    end
    puts board
    declare_winner
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

  def declare_winner
    if winner
      puts "\n#{winner} is the winner!"
    else
      puts "\nIt's a tie!"
    end 
  end
end