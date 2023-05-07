# frozen_string_literal: true

require_relative '../lib/engine'
require_relative '../lib/board'

describe Engine do
  subject(:engine_test) { described_class.new(player1_test,
                                              player2_test, board_test)}
  let(:player1_test) { instance_double(Player, color: 'X') }
  let(:player2_test) { instance_double(Player, color: 'O') }
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
  describe '#valid_input?' do

    context 'when the player inputs a number ranging from 1 to 7' do
      it 'returns true' do
        expect(engine_test.valid_input?("1")).to be true
      end
    end

    context 'when the player inputs 0' do
      it 'returns false' do
        expect(engine_test.valid_input?("0")).to be false
      end
    end

    context 'when the player inputs a number > 7' do
      it 'returns false' do
        expect(engine_test.valid_input?("8")).to be false
      end
    end
    
    context 'when the player doesn\'t input anyting' do
      it 'returns false' do
        expect(engine_test.valid_input?("")).to be false
      end
    end
    context 'when the player inputs something other than a number' do
      it 'returns false' do
        expect(engine_test.valid_input?("j")).to be false
      end
    end
  end
  
  describe '#valid_move?' do

    context 'when the input is invalid' do
      it 'returns false' do
        input = "j"
        expect(engine_test.valid_move?(input, board_test)).to be false
      end
    end

    context 'when the input is valid, and there is room left' do
      it 'returns true' do
        input = "2"
        allow(board_test).to receive(:space?).and_return(true)
        expect(engine_test.valid_move?(input, board_test)).to be true
      end
    end

    context 'when the input is valid, and there is no room left' do
      it 'returns false' do
        input = "2"
        allow(board_test).to receive(:space?).and_return(false)
        expect(engine_test.valid_move?(input, board_test)).to be false
      end
    end
  end

  describe '#game_over?' do
       
    context 'when the board is full' do
      it 'returns true' do
        allow(board_test).to receive(:full?).and_return(true)
        allow(engine_test).to receive(:someone_won?)
        expect(engine_test.game_over?).to be true
      end
    end
    context 'when someone won' do
      it 'returns true' do
        allow(board_test).to receive(:full?)
        allow(engine_test).to receive(:someone_won?).and_return(true)
        expect(engine_test.game_over?).to be true
      end
    end

    context 'when board isn\'t full and nobody won' do
      it 'returns false' do
        allow(board_test).to receive(:full?).and_return(false)
        allow(engine_test).to receive(:someone_won?).and_return(false)
        expect(engine_test.game_over?).to be false
      end
    end
  end

  describe '#someone_won?' do

    before do
      board_state = Array.new()
      7.times {board_state.push([])}
      board_state.each do |element|
        6.times { element.push(' ') }
      end
      board_state[0][3] = 'X'
      board_state[1][2] = 'X'
      board_state[2][1] = 'X'
      board_state[3][0] = 'X'
      board_test.instance_variable_set(:@board, board_state)
    end


    context 'when nobody won' do
      it 'returns false' do
        allow(board_test).to receive_message_chain(:transform_board, :each)
        expect(engine_test.someone_won?).to be false
      end
    end
    context 'when someone won' do
      it 'returns true' do
        allow(board_test).to receive_message_chain(:transform_board, :each)
        expect(engine_test.someone_won?).to be true
      end
    end
  end

end