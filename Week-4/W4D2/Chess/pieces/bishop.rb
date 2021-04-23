require_relative 'slideable.rb'
require_relative 'piece.rb'

class Bishop < Piece
    include Slideable
    attr_accessor :color

    def initialize(board, color, pos)
        super(board, color, pos)
    end

    def move_dirs
        diagonal_dirs
    end

    def symbol
        color == :white ? '♗' : '♝'
    end
end