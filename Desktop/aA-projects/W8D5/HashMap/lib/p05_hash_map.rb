require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
   bucket(key).include?(key)
  end

  def set(key, val)
    if !include?(key)
      resize! if num_buckets==@count
            @store[key.hash % num_buckets].append(key,val)
                  @count+=1
    else bucket(key).each do |node|
       if node.key==key 
        node.val=val
        return
       end
    end

    end
  end

  def get(key)
        if include?(key)
              bucket(key).get(key)
        end

  end

  def delete(key)
    bucket(key).remove(key)
    @count-=1
  end

  def each
    @store.each do |bucket|
        bucket.each do |node|
          yield [node.key,node.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_bucket_size=num_buckets*2
    newArr=Array.new(new_bucket_size) { LinkedList.new }
     @store.each do |bucket|
        bucket.each do |el|
           key=el.key
        val=el.val
          new_bucket=key.hash%new_bucket_size
          newArr[new_bucket].append(key,val)
        end
    end
     @store=newArr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key` 
    @store[key.hash%num_buckets]
  end
end
