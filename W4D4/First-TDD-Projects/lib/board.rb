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
        raise 'invalid move' unless valid_move?(t1, t2)
        towers[t2].unshift(disc)
        true
    end

    def valid_move?(t1, t2)
      unless towers[t2].empty? 
        return false if towers[t1].first > towers[t2].first 
      end

      true
    end

    def over? 

    end
end