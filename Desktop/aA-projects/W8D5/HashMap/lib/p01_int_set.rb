class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max=max
    @store=Array.new(@max,false)
  end

  def insert(num)
    is_valid?(num) 
     @store[num]=true if @store[num]==false
    @store[num]
  end

  def remove(num)
    @store[num]=false if is_valid?(num) 
  end

  def include?(num)
    if is_valid?(num)
      return true if @store[num]==true 
    end
       false
  end

  private

  def is_valid?(num)
   return true if num>0 && num<=@max
   raise "Out of bounds"
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
