require 'hand'
require 'card'
describe "Hand" do

# SUITS=["♠","♥","♣","♦"]
    let(:standard){[Card.new("A","♠"),
    Card.new("J","♠"),
    Card.new("K","♣"),
    Card.new("2","♠"),
    Card.new("5","♠")]}

  


    subject(:player_hand) { Hand.new(standard) }
    


    describe "#initialize" do
        it "should have 5 cards" do
            expect{Hand.new(standard[0..3])}.to raise_error("hand does not have 5 cards")
        end
    end

  
        let(:flush){Hand.new([Card.new("A","♠"),
        Card.new("J","♠"),
        Card.new("K","♠"),
        Card.new("2","♠"),
        Card.new("5","♠")])}
        let(:straight){Hand.new([Card.new("A","♠"),
        Card.new("5","♠"),
        Card.new("4","♣"),
        Card.new("2","♠"),
        Card.new("3","♠")])}
        let(:straight_flush){Hand.new([Card.new("A","♠"),
        Card.new("5","♠"),
        Card.new("4","♠"),
        Card.new("2","♠"),
        Card.new("3","♠")])}
        
        let(:four_of_a_kind){Hand.new([Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("3","♠")])}
        
        let(:full_house){Hand.new([Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("A","♣"),
        Card.new("3","♣"),
        Card.new("3","♠")])
        }

        let(:three_of_a_kind){Hand.new([Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("2","♣"),
        Card.new("3","♠")])
        }

        let(:two_pair){Hand.new([Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("2","♠"),
        Card.new("2","♣"),
        Card.new("3","♠")])
        }


        let(:pair){Hand.new([Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("7","♠"),
        Card.new("2","♣"),
        Card.new("3","♠")])
        }

          let(:high_card){Hand.new([Card.new("A","♠"),
    Card.new("J","♠"),
    Card.new("K","♣"),
    Card.new("2","♠"),
    Card.new("5","♠")])}

        let!(:hands) do
      [
        straight_flush,
        four_of_a_kind,
        full_house,
        flush,
        straight,
        three_of_a_kind,
        two_pair,
        pair,
        high_card]
    end


  
    describe "#calculate_hand" do 
        it "should return correct rank values" do 
       hands.each_with_index {|hand,idx| expect(hand.calculate_hand).to eq(idx+1)}
        end
    end

    describe "#compare_hand" do
        context "if two players have the same rank" do
                let(:pair2){Hand.new([Card.new("A","♠"),
                Card.new("7","♣"),
                Card.new("7","♣"),
                Card.new("2","♣"),
                Card.new("3","♠")])}
            it "should know the winner if two cards have the same rank" do
                    expect(pair1.compare_hand(pair2)).to eq(1)
            end

            it "should know the loser if two cards have the same rank" do
                    expect(pair2.compare_hand(pair)).to eq(-1)
            end

            it "should allow for there to be a draw as well of the pot" do 
                   let(:pair3){Hand.new([Card.new("A","♦"),
                    Card.new("A","♣"),
                    Card.new("7","♣"),
                    Card.new("2","♦"),
                    Card.new("3","♦")])
             }
                    expect(pair1.compare_hand(pair3)).to eq(0)
            end
        end


        context "if two players do not have the same rank" do 
            it "should award a winner" do
                # if player_hand.rank>other_player_hand.rank
                    expect(flush.compare_hand(pair)).to eq(1)
                # else expect(compare_hand).to be 
            end
        end
    end

    describe "#discard" do 
        it "should be able to discard a card" do 

        end
    end

    describe "#add" do 
        it "should be able to add a card from the deck" do 

        end
    end
   
end
