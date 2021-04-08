class Board
    attr_reader :towers

    def initialize
        @towers = Array.new(3) { [] }
        fill
    end

    def fill
        @towers[0] = [1, 2, 3, 4]
    end

    def make_move(t1, t2)
        disc = towers[t1].shift
        unless towers[t2].empty?
            raise 'invalid move' if disc > towers[t2].first
        end
        towers[t2].unshift(disc)
    end
end