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

    def add_child(child_node)
        child_node.parent = self 
    end

    def remove_child(child_node)
        if children.include?(child_node)
            child_node.parent = nil 
        else
            raise 
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child|
            current_node = child.dfs(target_value)
            return current_node if current_node 
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty? 
            current_node = queue.shift 
            return current_node if current_node.value == target_value
            current_node.children.each do |child|
                queue << child 
            end
        end
        nil 
    end




end