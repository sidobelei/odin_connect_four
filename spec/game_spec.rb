require_relative '../lib/game'

describe Game do
  describe 'initialize' do 
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
end