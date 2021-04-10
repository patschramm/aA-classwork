require_relative 'my_stack.rb'

class StackQueue

    def initialize
        @stack_queue = MyStack.new
    end

    def enqueue(ele)
        @stack_queue.push(ele)
    end

    def dequeue
        @stack_queue.pop
    end

    def size
        @stack_queue.size
    end
end