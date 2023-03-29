# frozen_string_literal: true

require_relative '../lib/engine'

describe Engine do
  subject(:engine_test) { described_class.new(player1_test,
                                              player2_test, board_test)}
  let(:player1_test) { instance_double(Player, color: 'blue') }
  let(:player2_test) { instance_double(Player, color: 'red') }
  let(:board_test) { instance_double(Board) }
  
  describe '#player1' do
    it 'returns player 1 as an attribute' do
      expect(engine_test.player1).to eq(player1_test)
    end
  end
  describe '#player2' do
    it 'returns player 2 as an attribute' do
      expect(engine_test.player2).to eq(player2_test)
    end
  end
  describe '#board' do
    it 'returns Board as an attribute' do
      expect(engine_test.board).to eq(board_test)
    end
  end

end