# beginning of array is top of stack

#  class Stack
#     def initialize
#         @stack=[]
#     end

#     def push(el)
#       @stack.unshift(el)
#     end

#     def pop
#       @stack.shift
#     end

#     def peek
#      @stack.first 
#     end
#   end

# end of array is top of stack

class Stack
    def initialize()
        @stack=[]
    end

    def push(el)
      @stack.push(el)
      el
    end

    def pop
      @stack.pop
    end

    def peek
      @stack.last 
    end
  end

  
class Queue 

    def initialize
      @queue=[]
    end

    def enqueue(el)
      @queue.push(el)
      el
    end

    def dequeue
      @queue.shift
    end 

    def peek
      @queue.first
    end




  end
    
q=Queue.new
q.enqueue(3)

# use only arrays
class Map

  def initialize
    @map=[]
  end

  def set(key, value) 
    @map.each_with_index do |el,idx| 
      if @map[idx][0]==key
          @map[idx][1]=value  
          return value
      end
    end
       @map<<[key,value] 
       value
  end

  def get(key)
    @map.each {|el| return el[1] if el[0]==key}
    nil
  end
  
  def delete(key)
    value=get(key)
        @map.dup.each {|el| @map.delete(el) if el[0]==key}
    value
  end   

  def show
        deep_dup(@map)
  end

   
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  


end