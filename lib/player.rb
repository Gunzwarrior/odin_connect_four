# frozen_string_literal: true

# Player class to choose where to play

class Player

  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play
    $stdin.gets.chomp
  end

end