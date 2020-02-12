class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum=0
    (0...self.length-1).each do |idx|
      sum+=self[idx].hash ^ idx.hash 
    end
    sum
  end
end

class String
  def hash
    self.split("").map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end
