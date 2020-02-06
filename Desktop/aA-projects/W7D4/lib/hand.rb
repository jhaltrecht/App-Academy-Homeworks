class Hand
    attr_reader :hand, :hand_value
    def initialize(hand)
        raise "hand does not have 5 card" unless hand.length==5
        @hand=hand
        @hand_value=0
        calculate_hand
    end

    def calculate_hand
        return @hand_value=1 if is_a_flush? && is_a_straight?
        return @hand_value=4 if is_a_flush? 
        return @hand_value=5 if is_a_straight? 
        return @hand_value=2 if is_a_four_of_a_kind?
        return @hand_value=3 if is_a_full_house?
        return @hand_value=6 if is_a_three_of_a_kind?
        return @hand_value=7 if is_a_two_pair?
        return @hand_value=8 if is_a_pair?
        return @hand_value=9 if is_a_high_card?
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
        # if @hand[0].suit==suit
    end

    def is_a_straight?
        
    end

    def is_a_three_of_a_kind?

    end

    def is_a_four_of_a_kind?

    end

    def is_a_full_house?

    end

    def is_a_two_pair?

    end

    def is_a_pair?

    end

    def is_a_high_card?

    end

    def draw?

    end

    # if card the same look to highest value
end

