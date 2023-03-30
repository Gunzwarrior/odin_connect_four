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

  def show_board
    pretty_board(@board)
  end

  def pretty_board(array)

    puts <<~BOARD
      [#{array[0][5]}] [#{array[1][5]}] [#{array[2][5]}] [#{array[3][5]}] [#{array[4][5]}] [#{array[5][5]}] [#{array[6][5]}]
      [#{array[0][4]}] [#{array[1][4]}] [#{array[2][4]}] [#{array[3][4]}] [#{array[4][4]}] [#{array[5][4]}] [#{array[6][4]}]
      [#{array[0][3]}] [#{array[1][3]}] [#{array[2][3]}] [#{array[3][3]}] [#{array[4][3]}] [#{array[5][3]}] [#{array[6][3]}]
      [#{array[0][2]}] [#{array[1][2]}] [#{array[2][2]}] [#{array[3][2]}] [#{array[4][2]}] [#{array[5][2]}] [#{array[6][2]}]
      [#{array[0][1]}] [#{array[1][1]}] [#{array[2][1]}] [#{array[3][1]}] [#{array[4][1]}] [#{array[5][1]}] [#{array[6][1]}]
      [#{array[0][0]}] [#{array[1][0]}] [#{array[2][0]}] [#{array[3][0]}] [#{array[4][0]}] [#{array[5][0]}] [#{array[6][0]}]
       1   2   3   4   5   6   7
    BOARD
  end

end