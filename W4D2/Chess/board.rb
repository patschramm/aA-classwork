require_relative 'piece.rb'


class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8) {Piece.new('')}}
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

    def move_piece(start_pos, end_pos)
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    def print
        # print board with piece names
        rows.each do |row|
            row.each do |ele|
                p ele.name
            end
        end
    end

end

