require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    @map.each do |node|
      if node.key==key
        # exists in cache, move node pos to end.
       update_node!(node)
        return node.value
      else 
        val=@prc.call(key)
        @store.append(key,val)
        #  add the key to your hash, along with a pointer to the new node.
        @map[key]=node
        eject! if count>@max
      end
    end


  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # prc.call(key)
    # suggested helper method; insert an (un-cached) key
  end
    # suggested helper method; move a node to the end of the list

  def update_node!(node)
      @store.delete(node.key)
       @map[node.key]=@store.append(node.key,node.val)
  end

  def eject!
    first_key=@store.first.key
    remove(first_key)
    @map.delete(first_key) 
  end
end
