class MinMaxStack
    attr_reader :max, :min

    def initialize
        @stack = []
        @max = nil
        @min = nil
    end

    def push(ele)
        @stack << ele
        @max = ele if !@max || ele > max
        @min = ele if !@min || ele < min
    end

    def pop
        last = @stack.last
        @stack = @stack[0..-2]
        last
    end

    def peek
        @stack.last
    end

    def empty?
        @stack == []
    end
end