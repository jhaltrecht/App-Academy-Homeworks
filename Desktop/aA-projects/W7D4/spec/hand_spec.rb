require 'hand'
require 'card'
describe "Hand" do

# SUITS=["♠","♥","♣","♦"]
    let(:standard){Hand.new([Card.new("A","♠"),
    Card.new("J","♠"),
    Card.new("K","♣"),
    Card.new("2","♠"),
    Card.new("5","♠")])}

  


    


    describe "#initialize" do
        it "should have 5 cards" do
            expect{Hand.new[Card.new("A","♠"),
            Card.new("J","♠"),
            Card.new("K","♣")]}.to raise_error{"hand does not have 5 cards"}
        end

        it "should be cards from the card class" do 
            standard.hand.each { |card| expect(card).to be_an_instance_of(Card)}
        end
    end

  
        let(:flush){Hand.new([Card.new("A","♠"),
        Card.new("J","♠"),
        Card.new("K","♠"),
        Card.new("2","♠"),
        Card.new("5","♠")])}
        let(:straight){Hand.new([Card.new("6","♠"),
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
     let(:flush2){Hand.new([Card.new("A","♠"),
        Card.new("5","♠"),
        Card.new("3","♠"),
        Card.new("2","♠"),
        Card.new("5","♠")])}
        let(:straight2){Hand.new([Card.new("A","♠"),
        Card.new("5","♠"),
        Card.new("4","♣"),
        Card.new("2","♠"),
        Card.new("3","♠")])}
        let(:straight_flush2){Hand.new([Card.new("6","♠"),
        Card.new("5","♠"),
        Card.new("4","♠"),
        Card.new("2","♠"),
        Card.new("3","♠")])}
        
        let(:four_of_a_kind2){Hand.new([Card.new("2","♠"),
        Card.new("2","♠"),
        Card.new("2","♠"),
        Card.new("2","♠"),
        Card.new("3","♠")])}
        
        let(:full_house2){Hand.new([Card.new("A","♠"),
        Card.new("A","♠"),
        Card.new("3","♣"),
        Card.new("3","♣"),
        Card.new("3","♠")])
        }

        let(:three_of_a_kind2){Hand.new([Card.new("A","♠"),
        Card.new("2","♠"),
        Card.new("2","♠"),
        Card.new("2","♣"),
        Card.new("3","♠")])
        }

        let(:two_pair2){Hand.new([Card.new("K","♠"),
        Card.new("K","♣"),
        Card.new("2","♣"),
        Card.new("2","♣"),
        Card.new("3","♠")])
        }


        let(:pair2){Hand.new([Card.new("2","♠"),
        Card.new("A","♠"),
        Card.new("7","♠"),
        Card.new("2","♣"),
        Card.new("3","♠")])
        }

          let(:high_card2){Hand.new([Card.new("6","♠"),
            Card.new("J","♠"),
            Card.new("4","♣"),
            Card.new("2","♠"),
            Card.new("5","♠")])}

        context "if two players have the same rank" do
            it "should know the winner if two cards have the same rank" do
                    expect(pair.compare_hand(pair2)).to eq(1)
                    expect(flush.compare_hand(flush2)).to eq(1)
                    expect(straight_flush.compare_hand(straight_flush2)).to eq(1)
                    expect(two_pair.compare_hand(two_pair2)).to eq(1)
                    expect(three_of_a_kind.compare_hand(three_of_a_kind2)).to eq(1)
                    expect(four_of_a_kind.compare_hand(four_of_a_kind2)).to eq(1)
                    expect(high_card.compare_hand(high_card2)).to eq(1)
                    expect(full_house.compare_hand(full_house2)).to eq(1)
            end

            it "should know the loser if two cards have the same rank" do
                     expect(pair2.compare_hand(pair)).to eq(-1)
                    expect(flush2.compare_hand(flush)).to eq(-1)
                    expect(straight_flush2.compare_hand(straight_flush)).to eq(-1)
                    expect(two_pair2.compare_hand(two_pair)).to eq(-1)
                    expect(three_of_a_kind2.compare_hand(three_of_a_kind)).to eq(-1)
                    expect(four_of_a_kind2.compare_hand(four_of_a_kind)).to eq(-1)
                    expect(high_card2.compare_hand(high_card)).to eq(-1)
                    expect(full_house2.compare_hand(full_house)).to eq(-1)
            end
                   let(:pair3){Hand.new([Card.new("A","♦"), Card.new("A","♣"),
                    Card.new("7","♣"),
                    Card.new("2","♦"),
                    Card.new("3","♦")])}

            it "should allow for there to be a draw as well for the pot" do 
                    expect(pair.compare_hand(pair3)).to eq(0)
            end
        end


        context "if two players do not have the same rank" do 
            it "should award a winner" do
                    expect(flush.compare_hand(pair)).to eq(1)
                    expect(flush.compare_hand(straight_flush)).to eq(-1)
            end
        end
    end
    describe "#discard" do 
     
 let!(:take_cards) { standard.hand[0..1] }
        it "will remove the card from the hand" do 
            standard.discard(0)
            expect(standard.hand).to_not include(take_cards)
        end

        it "will not let you have less than 0 cards" do 
            standard.discard(0)
            standard.discard(0)
            standard.discard(0)
            standard.discard(0)
            standard.discard(0)
            expect{standard.discard(0)}.to raise_error{"you can't discard more than 5 cards"}
        end

        it "will raise an error if you give it an invalid position" do
            expect{standard.discard(8)}.to raise_error{"invalid position"}
        end
    end

    describe "#add" do 

        # it "will subtract a card from the deck" do 
        #     let(:deck){double(leng)}
        #     expect()
        # end
                let!(:new_card) { Card.new("A","♦") }

        it "will not let you have more than 5 cards" do 
         expect{standard.add(new_card)}.to raise_error{"you can't have more than 5 cards"}
        end


        it "will add that card to the hand" do 
            expect(standard.discard(1))
            standard.add(new_card)
            expect(standard.hand).to include(new_card)
        end
    end
   
end
