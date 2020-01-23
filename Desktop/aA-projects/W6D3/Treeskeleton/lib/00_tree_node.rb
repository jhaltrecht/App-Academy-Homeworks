class PolyTreeNode
    attr_reader :value,:parent,:children
    def initialize(value)
        @value=value
        @parent=nil
        @children=[]
    end

    def parent=(node)
        @parent.children.delete(self) if !@parent.nil? 
        @parent=node
        @parent.children<<self unless @parent.nil?
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise "not a child" if child_node.parent!=self
        child_node.parent=(nil)
    end

    def inspect
        @value.inspect
    end
    
    def dfs(target_value)
        return self if self.value==target_value
        @children.each do |child|
          leftside= child.dfs(target_value) 
          return leftside if !leftside.nil?
        end
        nil
    end



    def bfs(target_value)
        tree=[self]
        while !tree.empty?
            return tree.first if tree.first.value==target_value
            node=tree.shift
                node.children.each do |child|
                    tree<<child
                end
        end
        nil
    end


end

