require_relative 'slideable.rb'
require_relative 'piece.rb'

class Queen < Piece
    include Slideable
    attr_accessor :color
    
    def initialize(board, color, pos)
      super(board, color, pos)
    end

    def move_dirs
        diagonal_dirs && horizontal_dirs
    end

    def symbol
        color == :white ? '♕' : '♛'
    end
end