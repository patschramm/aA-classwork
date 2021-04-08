require_relative 'pieces.rb'
require 'byebug'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8) {NullPiece.instance}}
        fill_board
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, piece)
        x, y = pos
        @rows[x][y] = piece
    end

    def add_piece(pos, piece)
        self[pos] = piece
    end

    def move_piece(start_pos, end_pos, color)
        piece = self[start_pos]
        
        
        raise "Not your piece" if piece.color != color
        raise "Not a valid move" if !piece.valid_moves.include?(end_pos)

        self[start_pos], self[end_pos] = NullPiece.instance, piece
        piece.pos = end_pos
    end

    def fill_pawns(color)
        row = (color == :white) ? 1 : 6
        (0..7).each { |col| Pawn.new(self, color, [row, col]) }
    end

    def fill_back_row(color)
        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        row = (color == :white) ? 0 : 7
        pieces.each_with_index { |piece, col| piece.new(self, color, [row, col]) }
    end

    def fill_board
        fill_pawns(:white)
        fill_pawns(:black)
        fill_back_row(:white)
        fill_back_row(:black)
    end

    def in_bounds?(pos)
        x, y = pos
        (0..7).to_a.include?(x) && (0..7).to_a.include?(y)
    end

    # def print_b
    #     # print board with piece names
    #     rows.each do |row|
    #         puts ''
    #         row.each do |ele|
    #             print ele.to_s
    #         end
    #     end
    # end

end

# a = Board.new
# # a.move_piece([1,0], [3,0], :white)
# # a.move_piece([0,0], [2,0], :white)
# # a.move_piece([2,0], [2,1], :white)
# # a.move_piece([1,3], [2,3], :white)
# # a.move_piece([2,1], [6,1], :white)
# # a.move_piece([0,0], [6,0], :white)
# a.move_piece([0,1], [2,2], :white)

# a.print_b