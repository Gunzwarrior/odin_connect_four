# frozen_string_literal: true

require_relative '../lib/piece'

describe Piece do
  subject(:piece_test) { described_class.new('blue') }

  describe '#color' do
    it 'returns a color attribute' do
      expect(piece_test.color).to eq('blue')
    end
  end
end