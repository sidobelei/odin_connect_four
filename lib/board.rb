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
end