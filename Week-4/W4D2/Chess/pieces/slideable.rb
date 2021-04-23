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
        move_dirs.each do |x, y|
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
            break if !board.in_bounds?(pos) || (!board[pos].is_a?(NullPiece) && board[pos].color == color)
            moves << pos
        end
        moves
    end

end