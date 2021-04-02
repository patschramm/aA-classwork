class PolyTreeNode

    attr_reader :parent, :children, :value 

    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end

    def parent=(new_parent) 
        parent.children.delete(self) if @parent != nil
        @parent = new_parent
        if @parent != nil
            new_parent.children << self 
        end
    end

    

end