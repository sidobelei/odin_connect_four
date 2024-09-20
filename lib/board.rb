class Board
  attr_accessor :display
  
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

  def check_vertically(row, index, piece)
    count = 0
    until count == 4
      if display[row][index] == piece
        count += 1
        if row + 1 > 5 && count != 4
          return false
        end
        row += 1
      else
        return false
      end
    end
    return true
  end

  def check_horizontally(row, index, piece)
    count = 0
    until count == 4
      if display[row][index] == piece
        count += 1
        if index + 1 > 6 && count != 4
          return false
        end
        index += 1
      else
        return false
      end
    end
    return true
  end
  
  def full?
    display.each do |row|
      row.each do |space|
        if space == '*'
          return false
        end
      end
    end
    return true
  end

  def to_s
    string = "0  1  2  3  4  5  6\n"
    display.each do |row|
      row.each_with_index do |space, index|
        if index == 6
          string = string + space
        else
          string = string + space + "  "
        end
      end
      string = string + "\n"
    end
    return string
  end
end