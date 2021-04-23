require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight < Piece
    KNIGTH_MOVES = [[2, 1], [-2, 1], [2, -1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]
    include Stepable
    attr_accessor :color

    def initialize(board, color, pos)
        super(board, color, pos)
    end

    def move_diff
        KNIGTH_MOVES
    end

    def symbol
        color == :white ? '♘' : '♞'
    end

end