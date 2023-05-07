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

  def game_over?
    return true if board.full? || someone_won?

    false
  end

  def someone_won?
    
    board.transform_board.each do |arr|
      return true if arr.each_cons(4).any? { |subarr| subarr.uniq.length == 1 && subarr.uniq[0] != ' ' }
    end
    false
  end

  def game_loop
    loop do
      player1_move = ""
      until valid_move?(player1_move, board)
        print "Player 1 > "
        player1_move = player1.play
      end
      board.add_piece(player1_move.to_i, player1.color)
      board.show_board
      @last_played = player1
      break if game_over?

      player2_move = ""
      until valid_move?(player2_move, board)
        print "Player 2 > "
        player2_move = player2.play
      end
      board.add_piece(player2_move.to_i, player2.color)
      board.show_board
      @last_played = player2
      break if game_over?

    end
    if someone_won? && @last_played == player1
      puts "Player 1 won"
    elsif someone_won? && @last_played == player2
      puts "Player 2 won"
    else
      puts "Draw"
    end
  end 

end