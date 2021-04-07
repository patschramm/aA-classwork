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
            pos if (0..7).to_a.include?(x) && (0..7).to_a.include?(y) && board[pos].color != color
        end
    end

    private

    def move_into_check?(end_pos)
        get_all_moves(end_pos).include?(king_pos)
        #method to switch color
        #method that finds king pos
        #get all moves method
    end

end

module Slideable
    HORIZONTAL_DIRS = [[1,0], [0,1], [0,-1], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        moves_dirs.each do |x, y|
            possible_moves.concat(grow_unblocked_moves_in_dir(x, y))
        end
        possible_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # build moves we can make
        curr_x, curr_y = pos
        moves = []

        until 0 != 0
            curr_x += dx
            curr_y += dy
            pos = [curr_x, curr_y]
            break if curr_x > 7 || curr_x < 0 || curr_y > 7 || curr_y < 0
            moves << pos
        end
        moves
    end

end

class Rook < Piece
