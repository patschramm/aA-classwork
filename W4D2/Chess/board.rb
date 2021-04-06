class Board

    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def [](pos)
        x, y = pos
        @row[x][y]
    end

    def []=(pos, piece)
        x, y = pos
        @row[x][y] = piece
    end

end

class Piece

    def initialize(name)
        @name = name
    end

end