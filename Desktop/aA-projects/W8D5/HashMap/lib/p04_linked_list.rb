require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
      prev_node=self.prev
      next_node=self.next
      next_node.prev=prev_node 
       prev_node.next=next_node
        self.prev=nil
        self.next=nil
    end
end

class LinkedList
  include Enumerable
  def initialize
    @head=Node.new
    @tail=Node.new
    @head.next=@tail
    @tail.prev=@head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next if !empty?
  end

  def last
    @tail.prev if !empty?
  end

  def empty?
     @head.next==@tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key==key
    end
    nil
  end

  def include?(key)
     self.each do |node|
      return true if node.key==key
    end
    false
  end

  def append(key, val)
    new_node=Node.new(key,val)
    prev_node=@tail.prev
    new_node.prev=prev_node
    prev_node.next=new_node
    new_node.next=@tail
    @tail.prev=new_node
    new_node
  end

  def update(key, val)
    self.each  {|node| node.val=val if node.key==key }
  end

  def remove(key)
    self.each do |node| 
      if node.key==key 
        node.remove 
        return
      end
    end

  end



  def each
    next_node=@head.next
    until next_node==@tail
          yield next_node
          next_node=next_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
