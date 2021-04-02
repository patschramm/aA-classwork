class PolyTreeNode

    attr_reader :parent, :children, :value 

    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end

    def parent=(new_node)
        new_parent = self.parent 
        if new_node != nil 
            
        end
    end



end