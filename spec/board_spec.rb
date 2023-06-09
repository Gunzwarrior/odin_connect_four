# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board_test) { described_class.new }

  describe '#new_board' do
    it 'returns an array of 7, 6 "empty space" elements array' do
      empty_board = [[" ", " ", " ", " ", " ", " "],
                     [" ", " ", " ", " ", " ", " "],
                     [" ", " ", " ", " ", " ", " "],
                     [" ", " ", " ", " ", " ", " "],
                     [" ", " ", " ", " ", " ", " "],
                     [" ", " ", " ", " ", " ", " "],
                     [" ", " ", " ", " ", " ", " "]]
      expect(board_test.new_board).to eq(empty_board)
    end
  end

  describe '#show_board' do

    it 'calls #pretty_board on @board' do
      board_attribute = board_test.instance_variable_get(:@board)
      allow(board_test).to receive(:pretty_board)
      expect(board_test).to receive(:pretty_board).with(board_attribute)
      board_test.show_board
    end
  end

  describe '#pretty_board' do
    context 'when board is empty' do
      it 'should show an empty board' do
        a = Array.new()
        7.times {a.push([])}
        a.each do |element|
          6.times { element.push(" ") }
        end 
        empty_board = <<~BOARD
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                         1   2   3   4   5   6   7
                      BOARD
        expect { board_test.pretty_board(a) }.to output(empty_board).to_stdout
      end
    end
    
    context 'whend board is not empty' do

      it 'should show the state of the board' do
        a = Array.new()
        7.times {a.push([])}
        a.each do |element|
          6.times { element.push(" ") }
        end 
        a[0][0] = 'X'
        a[3][0] = 'O'
        a[3][1] = 'X'
        not_empty_board = <<~BOARD
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [ ] [ ] [ ] [ ]
                        [ ] [ ] [ ] [X] [ ] [ ] [ ]
                        [X] [ ] [ ] [O] [ ] [ ] [ ]
                         1   2   3   4   5   6   7
                      BOARD
        expect { board_test.pretty_board(a) }.to output(not_empty_board).to_stdout
      end
    end
  end


  describe '#full?' do
    context 'when board is full' do
      before do
        board_state = Array.new()
        7.times {board_state.push([])}
        board_state.each do |element|
          6.times { element.push('X') }
        end
        board_test.instance_variable_set(:@board, board_state)
      end
      it 'returns true' do
        expect(board_test.full?).to be true
      end
    end
    context 'when board is not full' do
      before do
        board_state = Array.new()
        7.times {board_state.push([])}
        board_state.each do |element|
          6.times { element.push('X') }
        end
        board_state[0][1] = ' '
        board_test.instance_variable_set(:@board, board_state)
      end
      it 'returns false' do
        expect(board_test.full?).to be false
      end
    end
  end

  describe '#space?' do
    before do
      board_state = Array.new()
      7.times {board_state.push([])}
      board_state.each do |element|
        6.times { element.push('X') }
      end
      board_state[0][1] = ' '
      board_test.instance_variable_set(:@board, board_state)
    end
    context 'when there is space available' do
      it 'returns true' do
        expect(board_test.space?(1)).to be true
      end
    end
    context 'when there is no space available' do
      it 'returns false' do
        expect(board_test.space?(2)).to be false
      end
    end
  end

  describe '#add_piece' do
    before do
      board_state = Array.new()
      7.times {board_state.push([])}
      board_state.each do |element|
        6.times { element.push(' ') }
      end
      board_state[0][0] = 'red'
      board_test.instance_variable_set(:@board, board_state)
    end
    context 'when adding on the first row' do
      it 'changes the first subarray of board' do
        expected_subarray = ['red', 'blue', ' ', ' ', ' ', ' ']
        expect { board_test.add_piece(1, 'blue') }.to change {board_test.instance_variable_get(:@board)[0]}.to(expected_subarray)
      end
    end
    context 'when adding on the first row' do
      it 'changes the first subarray of board' do
        expected_subarray = ['blue', ' ', ' ', ' ', ' ', ' ']
        expect { board_test.add_piece(2, 'blue') }.to change {board_test.instance_variable_get(:@board)[1]}.to(expected_subarray)
      end
    end
  end

  describe '#transform_board' do
    context 'when board is empty' do
      before do
        board_state = Array.new()
        7.times {board_state.push([])}
        board_state.each do |element|
          6.times { element.push(' ') }
        end
        board_test.instance_variable_set(:@board, board_state)
      end
      it 'returns a new array of "empty subarrays"' do
        expected_array = [
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ']
        ]
        expect(board_test.transform_board).to eq(expected_array)
      end
    end
    context 'when board is not empty' do
      before do
        board_state2 = Array.new()
        7.times {board_state2.push([])}
        board_state2.each do |element|
          6.times { element.push(' ') }
        end
        board_state2[0][3] = 'X'
        board_state2[1][2] = 'X'
        board_state2[2][1] = 'X'
        board_state2[3][0] = 'X'
        board_test.instance_variable_set(:@board, board_state2)
      end
      it 'returns a new array of subarrays' do
        expected_array2 = [
          [' ', ' ', ' ', 'X', ' ', ' '],
          [' ', ' ', 'X', ' ', ' ', ' '],
          [' ', 'X', ' ', ' ', ' ', ' '],
          ['X', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', 'X', ' ', ' ', ' '],
          [' ', ' ', 'X', ' ', ' ', ' ', ' '],
          [' ', 'X', ' ', ' ', ' ', ' ', ' '],
          ['X', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          ['X', 'X', 'X', 'X'],
          [' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' '],
          [' ', 'X', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' '],
          [' ', 'X', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' '],
          ['X', ' ', ' ', ' ']
        ]
        expect(board_test.transform_board).to eq(expected_array2)
      end
    end
  end
end