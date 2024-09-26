require_relative '../lib/game'

describe Game do
  describe '#initialize' do 
    subject(:new_game) { described_class.new }

    context 'when an instance of Game is initialized' do
      it 'creates an array of two player objects' do
        expect(new_game.players.length).to eq(2)
        expect(new_game.players[0]).to be_an_instance_of(Player)
        expect(new_game.players[1]).to be_an_instance_of(Player)
      end
      it 'creates a board object' do
        expect(new_game.board).to be_an_instance_of(Board) 
      end
    end
  end

  describe '#get_move' do
    subject(:game) { described_class.new }
    let(:player) { game.players[0].name }

    context 'when a valid move is made' do
      before do
        allow_any_instance_of(Kernel).to receive(:print)
        allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
        allow(game.board).to receive(:valid_move?).and_return(true)
      end
      it 'returns the valid move' do
        expect(game.get_move(player)).to eq(3)
      end
    end

    context 'when an invalid move is made 3 times then a valid move is made' do
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return("70", "45", "1000", "6")
        allow(game.board).to receive(:valid_move?).and_return(false, false, false, true)
        allow_any_instance_of(Kernel).to receive(:print)
      end
      it 'calls valid_move? 4 times then returns a valid move' do
        expect(game.board).to receive(:valid_move?).exactly(4).times
        expect(game.get_move(player)).to eq(6)
      end
    end
  end

  describe '#declare_winner' do
    subject(:game) { described_class.new }
    let(:winner) { 'Player One' }

    context 'when there is a winner' do
      it 'prints the player who wins' do
        game.instance_variable_set(:@winner, winner)
        expect { game.declare_winner }.to output("\n#{winner} wins!\n").to_stdout
      end
    end

    context 'when there is no winner' do
      it "prints 'It's a tie!'" do
        expect { game.declare_winner }.to output("\nIt's a tie!\n").to_stdout
      end
    end
  end

  describe '#play_game' do
    subject(:game) { described_class.new }

    context 'when the game starts' do
      before do
        allow_any_instance_of(Kernel).to receive(:puts)
        allow(game).to receive(:get_move).and_return(3, 4)
        allow(game.board).to receive(:update)
        allow(game.board).to receive(:four_in_a_row?).and_return(false, true)
      end
      it 'calls get_move and board.update for each player turn' do
        expect(game).to receive(:get_move).twice
        expect(game.board).to receive(:update).twice
        game.play_game
      end
    end

    context 'when player one wins' do
      before do
        allow_any_instance_of(Kernel).to receive(:puts)
        allow(game).to receive(:get_move)
        allow(game.board).to receive(:update)
        allow(game.board).to receive(:four_in_a_row?).and_return(true)
      end

      it 'changes game_over to true' do
        expect{ game.play_game }.to change{ game.game_over }.to(true)
      end

      it 'changes winner to player one' do
        expect{ game.play_game }.to change{ game.winner }.to('Player One')
      end

      it 'declares player one as the winner' do
        expect(game).to receive(:declare_winner).and_return('\nPlayer One wins!\n')
        game.play_game
      end
    end

    context 'when player two wins' do
      before do
        allow_any_instance_of(Kernel).to receive(:puts)
        allow(game).to receive(:get_move)
        allow(game.board).to receive(:update)
        allow(game.board).to receive(:four_in_a_row?).and_return(false, true)
      end

      it 'changes game_over to true' do
        expect { game.play_game }.to change { game.game_over }.to(true)
      end

      it 'changes winner to player two' do
        expect { game.play_game }.to change { game.winner }.to('Player Two')
      end

      it 'declares player two as the winner' do
        expect(game).to receive(:declare_winner).and_return("\nPlayer Two wins!\n")
        game.play_game
      end
    end

    context 'when the board gets filled and there is no winner' do
      before do
        allow_any_instance_of(Kernel).to receive(:puts)
        allow(game).to receive(:get_move)
        allow(game.board).to receive(:update)
        allow(game.board).to receive(:four_in_a_row?).and_return(false)
        allow(game.board).to receive(:full?).and_return(true)
      end

      it 'changes game_over to true' do 
        expect { game.play_game }.to change { game.game_over}.to (true)
      end

      it 'declares a tie' do
        expect(game).to receive(:declare_winner).and_return("\nIt's a tie!\n")
        game.play_game
      end
    end
  end
end