require_relative 'piece.rb'

class Pawn < Piece



    def symbol
        color == :white ? '♙' : '♟'
    end
end