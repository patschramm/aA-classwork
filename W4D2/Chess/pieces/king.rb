require_relative 'piece.rb'
require_relative 'stepable.rb'

class King < Piece
    include Stepable
    attr_accessor :color

    KING_MOVES = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]

    def initialize(board, color, pos)
        super(board, color, pos)
    end

    def move_diff
        KING_MOVES
    end

    def symbol
        color == :white ? '♔' : '♚'
    end
end