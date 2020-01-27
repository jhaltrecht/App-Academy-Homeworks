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
      raise "Invalid starting cup"  if start_pos>13 || start_pos<0 
      raise "Starting cup is empty" if @cups[start_pos].empty?
      return true
  end

  def make_move(start_pos, current_player_name)
    raise "invalid move" unless valid_move?(start_pos)
                # debugger if current_player_name=="James" && start_pos==9

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
              # if currentPos==6
              #   @cups[currentPos]<<
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
                # debugger if current_player_name=="James" && start_pos==10

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
  end

  def winner
  end
  
end

 


 # if @name1==current_player_name
          #     next if currentPos==13
          #      if currentPos==6
          #       @cups[currentPos]+=[:stone]
          #                 @cups[start_pos].pop
          #                 next
          # else next if currentPos==6
          #    if currentPos==13
          #       @cups[currentPos]+=[:stone]
          #                 @cups[start_pos].pop
          #                 next
          #    end