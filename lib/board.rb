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

  def full?
    @board.each { |subarray| return false if subarray.include?(' ') }
    true
  end

  def space?(n)
    return true if @board[n-1].include?(' ')

    false
  end

  def add_piece(row, color)
    empty_space = @board[row-1].index(' ')
    @board[row-1][empty_space] = color
  end

  def transform_board
    flat_board = @board.flatten
    WIN_LINES.map do |win|
      flat_board.values_at(*win)
    end
  end

  WIN_LINES = [
    # vertical lines
    [0, 1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10, 11],
    [12, 13, 14, 15, 16, 17],
    [18, 19, 20, 21, 22, 23],
    [24, 25, 26, 27, 28, 29],
    [30, 31, 32, 33, 34, 35],
    [36, 37, 38, 39, 40, 41],
    # horizontal lines
    [0, 6, 12, 18, 24, 30, 36],
    [1, 7, 13, 19, 25, 31, 37],
    [2, 8, 14, 20, 26, 32, 38],
    [3, 9, 15, 21, 27, 33, 39],
    [4, 10, 16, 22, 28, 34, 40],
    [5, 11, 17, 23, 29, 25, 41],
    # top-left to bottom-right diagonal lines
    [3, 8, 13, 18],
    [4, 9, 14, 19, 24],
    [5, 10, 15, 20, 25, 30],
    [11, 16, 21, 26, 31, 36],
    [17, 22, 27, 32, 37],
    [23, 28, 33, 38],
    # bottom_left to top_right diagonal lines
    [2, 9, 16, 23],
    [1, 8, 15, 22, 29],
    [0, 7, 14, 21, 28, 35],
    [6, 13, 20, 27, 34, 41],
    [12, 19, 26, 33, 40],
    [18, 25, 32, 39]
  ].freeze

end