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
           # check for draw
            return 0 if draw?(other_hand)
        if @hand_value==other_hand.hand_value
            # cards should already be sorted
            return compare_high(other_hand) if @hand_value==4 || @hand_value==5 || @hand_value==9 || @hand_value==1
            return compare_four_of_a_kind(other_hand) if @hand_value==2
            return compare_full_house(other_hand) if @hand_value==3
            return compare_pair_or_three_of_a_kind(other_hand) if @hand_value==6 || @hand_value==8
            return compare_two_pair(other_hand) if @hand_value==7
        elsif @hand_value<other_hand.hand_value
            return 1
        else return -1
        end
    end
    
    private
    def is_a_flush?
        card_suit=@hand.first.suit
        @hand.all?{|card| card.suit==card_suit}
    end

    def is_a_straight?
        @hand.sort_by!{|card| card.rank}
        # need to sort my cards and adjust Ace based on position
        (0...@hand.length-1).all? do |idx| 
            # deal with Ace
           next true if @hand[-1].value=="A" && @hand.first.value=="2" && idx==3
           (@hand[idx].rank+1)==@hand[idx+1].rank
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
        false
    end

    def is_a_full_house?
        count=Hash.new(0)
        @hand.each{|card| count[card.value]+=1}
        oldValue=0
        count.each_value do |v|
            return false if v!=2 && v!=3
            if oldValue==3
                return false if v!=2 
            elsif oldValue==2
                return false if v!=3
            end
        end
        true
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

    def draw?(other_hand)
        @hand.each_with_index.all?{|card,idx| card.value==other_hand.hand[idx].value}
    end
# works for flush, high card, straight, and straight flush
    def compare_high(other_hand)
         (0..4).each do |idx|
                if @hand[-1-idx].rank>other_hand.hand[-1-idx].rank
                    return 1
                elsif @hand[-1-idx].rank<other_hand.hand[-1-idx].rank
                    return -1
                end
            end
    end

    def compare_four_of_a_kind(other_hand)
        count=Hash.new(0)
        other_hand_count=Hash.new(0)
        @hand.each{|card| count[card.rank]+=1}
        other_hand.hand.each{|card| other_hand_count[card.rank]+=1}
        player_card=count.key(4) 
        other_player_card=other_hand_count.key(4)
        return compare_high(other_hand) if player_card==other_player_card
        return 1 if player_card>other_player_card
        -1
    end

    def compare_full_house(other_hand)
        count=Hash.new(0)
        other_hand_count=Hash.new(0)
        @hand.each{|card| count[card.rank]+=1}
        other_hand.hand.each{|card| other_hand_count[card.rank]+=1}
        player_card=count.key(3) 
        other_player_card=other_hand_count.key(3)
        if player_card==other_player_card
            second_player_card=count.key(2)
            second_other_player_card=other_hand_count.key(2)
            return 1 if second_player_card>second_other_player_card
            return -1 if second_player_card<second_other_player_card
            raise "draw method should've done this"
        end
       return 1 if player_card>other_player_card
        -1
    end

    def compare_pair_or_three_of_a_kind(other_hand)
        count=Hash.new(0)
        other_hand_count=Hash.new(0)
        @hand.each{|card| count[card.rank]+=1}
        other_hand.hand.each{|card| other_hand_count[card.rank]+=1}
        keyParam=3 if @hand_value==6
        keyParam=2 if @hand_value==8
        player_card=count.key(keyParam) 
        other_player_card=other_hand_count.key(keyParam)
        return 1 if player_card>other_player_card
        return -1 if player_card<other_player_card
        return compare_high if other_player_card==player_card
    end


    def compare_two_pair(other_hand)
        count=Hash.new(0)
        other_hand_count=Hash.new(0)
        # changing sort order to retrieve highest pair
        @hand.reverse!{|card| card.rank}
        other_hand.hand.reverse!{|card| card.rank}
        @hand.each{|card| count[card.rank]+=1}
        other_hand.hand.each{|card| other_hand_count[card.rank]+=1}
        player_card=count.key(2) 
        other_player_card=other_hand_count.key(2)
        if player_card==other_player_card
            # reversing back to retreive the weaker second pair
            @hand.reverse!{|card| card.rank}
            other_hand.hand.reverse!{|card| card.rank}
            second_player_card=count.key(2)
            second_other_player_card=other_hand_count.key(2)
            return 1 if second_player_card>second_other_player_card
            return -1 if second_player_card<second_other_player_card
            last_player_card=count.key(1)
            last_other_player_card=other_hand_count.key(1)
            return 1 if last_player_card>last_other_player_card
            return -1
        else return 1 if player_card>other_player_card
        end
        -1
    end
    

    # if card the same look to highest value
end

