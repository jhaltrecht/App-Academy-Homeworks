require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'


class LRUCache
    attr_reader :max, :prc

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
          
    if @map[key]
          node=@map[key]
          update_node!(node)
          node.val
    else calc!(key)
    end
  end
  # end




  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private
  attr_reader :store, :map

  def calc!(key)
    val=@prc.call(key)
        #  add the key to your hash, along with a pointer to the new node.
        @map[key]=@store.append(key,val)
        eject! if count>@max
        val
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
      @store.remove(node.key)
       @map[node.key]=@store.append(node.key,node.val)
  end

  def eject!
    first_key=@store.first.key
    @store.remove(first_key)
    @map.delete(first_key) 
  end
end
