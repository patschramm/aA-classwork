module Stepable
    def moves
        possible_moves = []
        move_diff.each do |x, y|
            possible_moves << [pos[0] + x, pos[1] + y]
        end

        possible_moves
    end
end