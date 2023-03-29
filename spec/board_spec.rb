# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board_test) { described_class.new }

  describe '#new_board' do
    it 'returns an array of 7, 6 "empty space" elements array' do
      expect(board_test.new_board).to eq([[" ", " ", " ", " ", " ", " "],
                                          [" ", " ", " ", " ", " ", " "],
                                          [" ", " ", " ", " ", " ", " "],
                                          [" ", " ", " ", " ", " ", " "],
                                          [" ", " ", " ", " ", " ", " "],
                                          [" ", " ", " ", " ", " ", " "],
                                          [" ", " ", " ", " ", " ", " "]])
    end
  end
end