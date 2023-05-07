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

  def valid_input?(input)
    return true if input.match(/^[1-7]$/)
    false
  end

  def valid_move?(input, board)

    return true if valid_input?(input) && board.space?(input.to_i)

    false
  end
end