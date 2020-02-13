class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
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
      @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_bucket_size=num_buckets*2
    newArr=Array.new(new_bucket_size) { Array.new }
     @store.each do |bucket|
      bucket.each do |el|
      new_bucket=el.hash%new_bucket_size
      newArr[new_bucket]<<el
     end
    end
     @store=newArr
  end
end
