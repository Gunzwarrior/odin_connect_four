# frozen_string_literal: true

# Act as the board for the game

class Board
  def initialize
    @board = new_board
  end

  def new_board
    array = Array.new()
    7.times {array.push([])}
    array.each do |element|
      6.times { element.push(" ") }
    end
    array
  end
end