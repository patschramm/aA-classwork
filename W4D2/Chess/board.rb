require_relative 'pieces.rb'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8) {NullPiece.instance}}
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

    def in_bounds?(pos)
        x, y = pos
        (0..7).to_a.include?(x) && (0..7).to_a.include?(y)
    end

    def print
        # print board with piece names
        rows.each do |row|
            row.each do |ele|
                p ele.symbol
            end
        end
    end

end

a = Board.new
rook = Rook.new(a, :white, [0,0])
# p a
p a.print