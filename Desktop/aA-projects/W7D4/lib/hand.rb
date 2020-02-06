class Hand
    require 'byebug'
    require_relative 'card'
    attr_reader :hand, :hand_value
    def initialize(hand)
        raise "hand does not have 5 cards" unless hand.length==5
        @hand=hand
        @hand_value=0
        calculate_hand
    end

    def calculate_hand
        # debugger
        return @hand_value=1 if is_a_flush? && is_a_straight?
        return @hand_value=2 if is_a_four_of_a_kind?
        return @hand_value=3 if is_a_full_house?
        return @hand_value=4 if is_a_flush? 
        return @hand_value=5 if is_a_straight? 
        return @hand_value=6 if is_a_three_of_a_kind?
        return @hand_value=7 if is_a_two_pair?
        return @hand_value=8 if is_a_pair?
        return @hand_value=9 if is_a_high_card?
        p @hand_value
    end

    def compare_hand(other_hand)
        raise "this is not a hand" unless other_hand.is_a?(Hand)
        if player_hand.rank==other_player_hand.rank
#                 if implement comparison
#             end
            
                # elsif draw? return "draw"
        elsif player_hand.rank>other_player_hand.rank 
            return true
        else return false
        end
    end
    
    private
    def is_a_flush?
        card_suit=@hand.first.suit
        @hand.all?{|card| card.suit==card_suit}
    end

    def is_a_straight?
        debugger
        @hand.sort_by!{|card| card.rank}
        # need to sort my cards and adjust Ace based on position
        (0...@hand.length-1).all? do |idx| 
            # deal with Ace
           next true if @hand.last.value=="A" && @hand.first.value=="2" 
           (@hand[idx].rank+1)==@hand[idx+1]
        end
    end

    def is_a_three_of_a_kind?
        return false if is_a_flush? || is_a_straight? || is_a_full_house?
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
        count.each_value do |v|
            return true if v==3
        end
        false
    end

    def is_a_four_of_a_kind?
        return false if is_a_straight? && is_a_flush?
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
        count.each_value do |v|
            return true if v==4
        end
    end

    def is_a_full_house?
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
        oldValue=0
        count.each_value do |v|
            if oldValue==3
                return false if v!=2 
            elsif oldValue==2
                return false if v!=3
            end
                oldValue=v
        end
    end

    def is_a_two_pair?
        return false if is_a_flush? || is_a_straight? 
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
       return true if count.count{|k,v| count[k]==2}==2
       false
    end

    def is_a_pair?
        return false if is_a_flush? || is_a_straight? 
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
        return true if count.count{|k,v| count[k]==2}==1 &&  count.count{|k,v| count[k]==1}==3
        false
    end

    def is_a_high_card?
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
        return true if count.count{|k,v| count[k]==1}==5
        false
    end

    def draw?

    end
    

    # if card the same look to highest value
end

