require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1=name1
    @name2=name2
    @cups=Array.new(14){Array.new()}
    place_stones
  end

  def place_stones
        @cups.each_with_index do |__,idx|
          next if idx==6 || idx==13
          @cups[idx]+=[:stone,:stone,:stone,:stone]
        end
      
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
      raise "Invalid starting cup"  if start_pos>12 || start_pos<0 || start_pos==6
      raise "Starting cup is empty" if @cups[start_pos].empty?
      return true
  end

  def make_move(start_pos, current_player_name)
    raise "invalid move" unless valid_move?(start_pos)
    counter=0
    countOfSkips=0
      until @cups[start_pos].length==0
        counter+=1
        currentPos=(start_pos+counter)%14
          if @name1==current_player_name
               if currentPos==13
                countOfSkips+=1
                next
               end
          else 
            if currentPos==6
            countOfSkips+=1
            next
            end
          end
          @cups[currentPos].push(:stone)
          @cups[start_pos].pop
      end
          render
        return next_turn(currentPos)
  end

  def next_turn(ending_cup_idx)
    
  return :prompt if ending_cup_idx== 6 || ending_cup_idx==13
   return :switch if @cups[ending_cup_idx].length==1
   return ending_cup_idx if @cups[ending_cup_idx].length>1

    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
   return true if @cups[0..5].all?{|cup| cup.empty?} 
  return true if @cups[7..12].all?{|cup| cup.empty?} 
   false
  end

  def winner
    return :draw if @cups[6].length==@cups[13].length
    return @name1 if @cups[6].length>@cups[13].length
    return @name2 if @cups[6].length<@cups[13].length
  end
  
end

 