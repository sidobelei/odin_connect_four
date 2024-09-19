class Board
  attr_reader :display
  def initialize 
    @display = [
      ['*', '*', '*', '*', '*', '*', '*'],
      ['*', '*', '*', '*', '*', '*', '*'],
      ['*', '*', '*', '*', '*', '*', '*'],
      ['*', '*', '*', '*', '*', '*', '*'],
      ['*', '*', '*', '*', '*', '*', '*'],
      ['*', '*', '*', '*', '*', '*', '*']
    ]
  end

  def update(column, piece)
    index = display.length - 1
    while index >= 0 do
      if display[index][column] == '*'
        @display[index][column] = piece
        break
      end
      index -= 1
    end
  end

  def valid_move?(column)
    if column > 6 || column < 0
      return false
    end
    index = display.length - 1 
    while index >= 0 
      if display[index][column] == '*'
        return true
      end
      index -= 1
    end
    return false
  end
end