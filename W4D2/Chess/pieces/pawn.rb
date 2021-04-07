require_relative 'piece.rb'

class Pawn < Piece
    attr_accessor :color, :pos


    def initialize(board, color, pos)
        super(board, color, pos)
    end

    def symbol
        color == :white ? '♙' : '♟'
    end

    def moves
        possible_moves = []
        forward_steps.each do |x, y|
            curr_move = [pos[0] + x, pos[1] + y]
            possible_moves.concat(curr_move) if board[curr_move].is_a?(NullPiece)
        end
    end

    private
    def at_start_row?
        if color == :white
            return pos[1] == 6 
        else
            return pos[1] == 1
        end
    end

    def forward_dir
        if color == :white
            return -1
        else
            return 1
        end
    end

    def forward_steps
        pawn_moves = []
        pawn_moves << [forward_dir * 2, 0] if at_start_row?
        pawn_moves << [forward_dir, 0]
        pawn_moves
    end
    
    def side_attacks
        attack_moves = [[forward_dir,1], [forward_dir,-1]]
    end
end