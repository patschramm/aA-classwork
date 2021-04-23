

class Piece
    attr_reader :board, :color
    attr_accessor :pos

    def initialize(board, color, pos)
        @board = board
        @color = color
        @pos = pos
        board.add_piece(pos, self)
    end

    def valid_moves
        moves.select do |pos|
            x, y = pos
            board.in_bounds?(pos) && (board[pos].color != color || board[pos].is_a?(NullPiece))
        end
    end

    def empty?
        board[pos].is_a?(NullPiece)
    end

    def to_s
        " #{symbol} "
    end
    # def pos=(val)
    #     board[pos]
    # end
    private

    def move_into_check?(end_pos)
        # get_all_moves(end_pos).include?(king_pos)
        #method to switch color
        #method that finds king pos
        #get all moves method
    end

end



