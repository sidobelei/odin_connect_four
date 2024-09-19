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
end