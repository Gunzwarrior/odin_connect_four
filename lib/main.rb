# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'engine'
require_relative 'piece'

my_game = Engine.new(Player.new("X"), Player.new("O"), Board.new)

my_game.game_loop