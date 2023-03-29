# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Act as the game engine handling logic and looping methods

class Engine
  attr_reader :player1, :player2, :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end
end