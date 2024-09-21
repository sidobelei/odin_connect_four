require_relative '../lib/board'

describe Board do
  describe '#update' do
    subject(:board) {described_class.new}
    let(:p1_piece) { 'x' }
    let(:p2_piece) { 'o' }
    
    context 'when given a game piece' do
      it "place player one's game piece" do
        expect { board.update(0, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],  
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*']
        ])
      end

      it "place player two's game piece" do
        expect{ board.update(0, p2_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          [p2_piece, '*', '*', '*', '*', '*', '*']
        ])
      end
    end

    context 'when the board is empty' do
      it 'it can place a piece in the furtherest left column' do
        expect{ board.update(0, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*']
        ])
      end

      it 'it can place a piece in the middle column' do
        expect{ board.update(3, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*']
        ])
      end

      it 'it can place a piece in the furthest right column' do
        expect{ board.update(6, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', p1_piece]
        ])
      end
    end

    context 'when you place a piece in a column that is only one piece high' do
      it 'it can place a piece in the furtherest left column' do
        board.update(0, p1_piece)
        expect{ board.update(0, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*']
        ])
      end

      it 'it can place a piece in the middle column' do
        board.update(3, p1_piece)
        expect{ board.update(3, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*']
        ])
      end

      it 'it can place a piece in the furthest right column' do
        board.update(6, p1_piece)
        expect{ board.update(6, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece]
        ])
      end
    end

    context 'when you place a piece in a column that is half filled' do
      it 'it can place a piece in the furtherest left column' do
        for i in 1..3 do
          board.update(0, p1_piece)
        end
        expect{ board.update(0, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*']
        ])
      end

      it 'it can place a piece in the middle column' do
        for i in 1..3 do
          board.update(3, p1_piece)
        end
        expect{ board.update(3, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*']
        ])
      end

      it 'it can place a piece in the furthest right column' do
        for i in 1..3 do
          board.update(6, p1_piece)
        end
        expect{ board.update(6, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece]
        ])
      end
    end

    context 'when you place a piece in a column that is nearly filled' do
      it 'it can place a piece in the furtherest left column' do
        for i in 1..5 do
          board.update(0, p1_piece)
        end
        expect{ board.update(0, p1_piece) }.to change{ board.display }.to([
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*']
        ])
      end

      it 'it can place a piece in the middle column' do
        for i in 1..5 do
          board.update(3, p1_piece)
        end
        expect{ board.update(3, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*']
        ])
      end

      it 'it can place a piece in the furthest right column' do
        for i in 1..5 do
          board.update(6, p1_piece)
        end
        expect{ board.update(6, p1_piece) }.to change{ board.display }.to([
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece]
        ])
      end
    end
  end

  describe '#valid_move?' do
    subject(:board) {described_class.new}
    let(:p1_piece) { 'x' }
    context 'when you place a piece in an empty column' do
      it 'returns true' do
        expect(board.valid_move?(3)).to be(true)
      end
    end

    context 'when you place a piece in a partially filled column' do
      it 'returns true' do
        for i in 1..4 do
          board.update(4, p1_piece)
        end
        expect(board.valid_move?(4)).to be(true)
      end
    end

    context 'when you place a piece in a full column' do
      it 'returns false' do
        for i in 1..6 do
          board.update(4, p1_piece)
        end
        expect(board.valid_move?(4)).to be(false)
      end
    end

    context 'when you give an invalid location' do
      context 'when you give a negative numbered column' do
        it 'returns false' do
          expect(board.valid_move?(-1)).to be(false)
        end
      end

      context 'when you give a column location larger than 6' do
        it 'returns false' do
          expect(board.valid_move?(300)).to be(false)
        end
      end
    end
  end

  describe '#check_vertically' do
    subject(:board) { described_class.new }
    let(:p1_piece) { 'x' }
    let(:p2_piece) { 'o' }
    
    context 'when checking for vertical wins' do
      it 'detects a vertical win at the top of the column' do
        board.display = [
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_vertically(0, 3, p1_piece)).to be(true)
      end

      it 'detects a vertical win in the middle of a column' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_vertically(1, 3, p1_piece)).to be(true)
      end

      it 'detects a vertical win at the bottom of a column' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*']
        ]
        expect(board.check_vertically(2, 3, p1_piece)).to be(true)
      end

      it 'detects a vertical win in the first column' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_vertically(1, 0, p1_piece)).to be(true)
      end

      it 'detects a vertical win in the last column' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_vertically(1, 6, p1_piece)).to be(true)
      end

      it 'detects a vertical win in a partially filled board' do
        board.display = [
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          ['*', p2_piece, '*', '*', '*', '*', '*'],
          [p2_piece, p1_piece, p2_piece, p2_piece, p1_piece, p2_piece, '*']
        ]
        expect(board.check_vertically(0, 1, p1_piece)).to be(true)
      end
      
      it 'does not detect a vertical win if the board is empty' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_vertically(1, 1, p1_piece)).to be(false)
      end
    end
  end

  describe '#check_horizontally' do
    subject(:board) { described_class.new }
    let(:p1_piece) { 'x' }
    let(:p2_piece) { 'o' }

    context 'when checking for horizontal wins' do
      it 'detects a horizontal win at the left most side of the row' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          [p1_piece, p1_piece, p1_piece, p1_piece, '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_horizontally(2, 0, p1_piece)).to be(true)
      end

      it 'detects a horizontal win in the middle of a row' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', p1_piece, p1_piece, p1_piece, p1_piece, '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_horizontally(2, 2, p1_piece)).to be(true)
      end

      it 'detects a horizontal win at the right most side of the row' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, p1_piece, p1_piece, p1_piece],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_horizontally(2, 3, p1_piece)).to be(true)
      end

      it 'detects a horizontal win in the first row' do
        board.display = [
          ['*', p1_piece, p1_piece, p1_piece, p1_piece, '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_horizontally(0, 1, p1_piece)).to be(true)
      end

      it 'detects a horizontal win in the last row' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', p1_piece, p1_piece, p1_piece, p1_piece, '*', '*']
        ]
        expect(board.check_horizontally(5, 1, p1_piece)).to be(true)
      end

      it 'detects a horizontal win in a partially filled board' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', p1_piece, p1_piece, p1_piece, p1_piece, '*'],
          ['*', '*', p2_piece, p1_piece, p2_piece, p2_piece, '*'],
          ['*', '*', p2_piece, p1_piece, p2_piece, p1_piece, '*']
        ]
        expect(board.check_horizontally(3, 2, p1_piece)).to be(true)
      end

      it 'does not detect a win an empty board' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_horizontally(3, 1, p1_piece)).to be(false)
      end
    end
  end

  describe '#check_diagonal_ascending' do
    subject(:board) { described_class.new }
    let(:p1_piece) { 'x' }
    let(:p2_piece) { 'o' }

    context 'when checking for ascending diagonal wins' do
      it 'detects an ascending diagonal win starting from the bottom-left' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', p1_piece, '*', '*', '*', '*'],
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_diagonal_ascending(2, 3, p1_piece)).to be(true)
      end

      it 'detects an ascending diagonal win starting from the middle' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', p1_piece, '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', p1_piece, '*', '*', '*', '*'],
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_diagonal_ascending(1, 4, p1_piece)).to be(true)
      end

      it 'detects an ascending diagonal win starting from the top-right' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', p1_piece, '*'],
          ['*', '*', '*', '*', p1_piece, '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_diagonal_ascending(0, 6, p1_piece)).to be(true)
      end

      it 'detects the leftmost ascending diagonal win' do
        board.display = [
          ['*', '*', '*', p1_piece, '*', '*', '*'],
          ['*', '*', p1_piece, '*', '*', '*', '*'],
          ['*', p1_piece, '*', '*', '*', '*', '*'],
          [p1_piece, '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_diagonal_ascending(0, 3, p1_piece)).to be(true)
      end

      it 'detects the rightmost ascending diagonal win' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', p1_piece],
          ['*', '*', '*', '*', '*', p1_piece, '*'],
          ['*', '*', '*', '*', p1_piece, '*', '*'],
          ['*', '*', '*', p1_piece, '*', '*', '*']
        ]
        expect(board.check_diagonal_ascending(2, 6, p1_piece)).to be(true)
      end

      it 'detects an ascending diagonal win when the board is partially filled' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', p1_piece, '*', '*'],
          [p2_piece, '*', '*', p1_piece, p1_piece, '*', '*'],
          [p2_piece, '*', p1_piece, p1_piece, p1_piece, '*', '*'],
          [p2_piece, p1_piece, p2_piece, p2_piece, p2_piece, '*', '*']
        ]
        expect(board.check_diagonal_ascending(2, 4, p1_piece)).to be(true)
      end

      it 'does not detect an ascending diagonal win on an empty board' do
        board.display = [
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*'],
          ['*', '*', '*', '*', '*', '*', '*']
        ]
        expect(board.check_diagonal_ascending(1, 6, p1_piece)).to be(false)
      end
    end
  end

  describe '#full?' do
    subject(:board) { described_class.new }
    let(:p2_piece) {'o'}
    
    context 'when the board is empty' do
      it 'returns false' do
        expect(board.full?).to be(false)  
      end
    end

    context 'when the board is partially filled' do
      context 'when there is one piece on the board' do
        it 'returns false' do
          board.update(2, p2_piece)
          expect(board.full?).to be(false)
        end
      end

      context 'when half the board is filled' do
        it 'returns false' do
          for i in 1..6 do
            board.update(0, p2_piece)
          end
          for i in 1..4 do
            board.update(1, p2_piece)
            board.update(2, p2_piece)
          end
          for i in 1..3 do
            board.update(3, p2_piece)
            board.update(4, p2_piece)
          end
          board.update(6, p2_piece)
          expect(board.full?).to be(false)
        end
      end

      context 'when there is only one space to be filled' do
        it 'return false' do
          for i in 1..6 do
            board.update(0, p2_piece)
            board.update(1, p2_piece)
            board.update(3, p2_piece)
            board.update(4, p2_piece)
            board.update(5, p2_piece)
            board.update(6, p2_piece)
          end
          for i in 1..5 do
            board.update(2, p2_piece)
          end
          expect(board.full?).to be(false)
        end
      end
    end

    context 'when the board is full' do
      it 'returns true' do
        for i in 1..6 do
          board.update(0, p2_piece)
          board.update(1, p2_piece)
          board.update(2, p2_piece)
          board.update(3, p2_piece)
          board.update(4, p2_piece)
          board.update(5, p2_piece)
          board.update(6, p2_piece)
        end
        expect(board.full?).to be(true)
      end
    end
  end

  describe '#to_s' do
    subject(:board) { described_class.new }
    let(:p1_piece) { 'x' }
    let(:p2_piece) { 'o' }
    
    context 'when the board is empty' do
      it 'returns an empty board string' do
        expect(board.to_s).to eq(
          "0  1  2  3  4  5  6\n*  *  *  *  *  *  *\n*  *  *  *  *  *  *\n*  *  *  *  *  *  *\n*  *  *  *  *  *  *\n*  *  *  *  *  *  *\n*  *  *  *  *  *  *\n"  
          )
      end
    end

    context 'when the board is partially filled' do
      it 'returns the partially filled board string' do
        for i in 1..6 do
          board.update(6, p1_piece)
        end
        for i in 1..5 do
          board.update(1, p1_piece)
        end
        for i in 1..4 do
          board.update(3, p1_piece)
        end
        for i in 1..3 do
          board.update(2, p1_piece)
        end
        for i in 1..2 do
          board.update(4, p1_piece)
        end
        board.update(0, p1_piece)
        expect(board.to_s).to eq(
          "0  1  2  3  4  5  6\n*  *  *  *  *  *  x\n*  x  *  *  *  *  x\n*  x  *  x  *  *  x\n*  x  x  x  *  *  x\n*  x  x  x  x  *  x\nx  x  x  x  x  *  x\n"  
          )
      end
    end

    context 'when the board is full' do
      it 'returns a full board string' do
        for i in 1..6 do
          board.update(0, p2_piece)
          board.update(1, p2_piece)
          board.update(2, p2_piece)
          board.update(3, p2_piece)
          board.update(4, p2_piece)
          board.update(5, p2_piece)
          board.update(6, p2_piece)
        end
        expect(board.to_s).to eq(
          "0  1  2  3  4  5  6\no  o  o  o  o  o  o\no  o  o  o  o  o  o\no  o  o  o  o  o  o\no  o  o  o  o  o  o\no  o  o  o  o  o  o\no  o  o  o  o  o  o\n"  
          )
      end
    end
  end
end