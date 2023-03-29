# frozen_string_literal: true

# Pieces played on the board

class Piece
  attr_reader :color
  
  def initialize(color)
    @color = color
  end
end