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
    self[num]<<num if !include?(num)
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
    resize! if @count>=num_buckets
    if !include?(num)
      self[num]<<num 
      @count+=1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count-=1
    end
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
      @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # return if @count!=num_buckets
    new_bucket_size=num_buckets*2
    newArr=Array.new(new_bucket_size) { Array.new }
     @store.each do |bucket|
      bucket.each do |el|
      new_bucket=el%new_bucket_size
      newArr[new_bucket]<<el
     end
    end
     @store=newArr
  end
end
