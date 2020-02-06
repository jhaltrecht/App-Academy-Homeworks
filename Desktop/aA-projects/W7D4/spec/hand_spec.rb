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
        standard]
    end


  
    describe "#calculate_hand" do 
        it "should return correct rank values" do 
       hands.each_with_index {|hand,idx| expect(hand.calculate_hand).to eq(idx+1)}
        end
    end


    # rspec should not test private methods..
    # describe "#is_a_flush" do
    #     it "should know if a player has a flush" do 
    #         allow(card1).to_receive(:suit).and_return("♠") 
    #         allow(card2).to_receive(:suit).and_return("♠")
    #         allow(card3).to_receive(:suit).and_return("♠")
    #         allow(card4).to_receive(:suit).and_return("♠")
    #         allow(card5).to_receive(:suit).and_return("♠")
    #         expect(is_a_flush).to be true
    #     end

    #     it "should know if a player does not have a flush" do 
    #         allow(card1).to_receive(:suit).and_return("♠") 
    #         allow(card2).to_receive(:suit).and_return("♠")
    #         allow(card3).to_receive(:suit).and_return("♦")
    #         allow(card4).to_receive(:suit).and_return("♠")
    #         allow(card5).to_receive(:suit).and_return("♠")
    #         expect(is_a_flush).to be false
    #     end
    # end
    describe "#compare_hand" do
        context "if two players have the same rank" do
  
            it "should know the winner if two cards have the same rank" do
                
                    expect(player1).to be winner
            end

            it "should allow for there to be a draw as well of the pot" do 
                #  if player_hand.rank==other_player_hand.rank
                    expect(compare_hand).to be false
            end
        end


        context "if two players do not have the same rank" do 
            it "should award a winner" do
                # if player_hand.rank>other_player_hand.rank
                    expect(compare_hand).to be player_hand
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
