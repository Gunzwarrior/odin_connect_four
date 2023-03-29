# frozen_string_literal: true

require 'stringio'
require_relative '../lib/player'

describe Player do
  subject(:player_test) { described_class.new('blue') }
  
  describe '#color' do
    it 'returns a color attribute' do
      expect(player_test.color).to eq('blue')
    end
  end

  describe '#play' do
    let(:input) { StringIO.new('1')}

    before do
      $stdin = input
    end

    after do
      $stdin = STDIN
    end
    
    it 'takes and return a user input' do
      expect(player_test.play).to eq('1')
    end
  end
end