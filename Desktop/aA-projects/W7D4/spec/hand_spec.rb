require 'hand'

describe "Hand" do
    let(:card1){double("card1")}
    let(:card2){double("card2")}
    let(:card3){double("card3")}
    let(:card4){double("card4")}
    let(:card5){double("card5")}
    let(:card6){double("card6")}
    let(:card7){double("card7")}
    let(:card8){double("card8")}
    let(:card9){double("card9")}
    let(:card10){double("card10")}

    subject (:player_hand){Hand.new([card1,card2,card3,card4,card5])} 
    let (:other_player_hand){Hand.new([card6,card7,card8,card9,card10])} 

    describe "#initialize" do
        it "should have 5 cards" do
            unless player_hand.hand.length==5
            expect{player_hand}.to raise_error("hand does not have 5 card")
            end
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
    describe "#compare_hand"
        context "if two players have the same rank" do
            it "should know the winner if two cards have the same rank" do
                # if player_hand.rank==other_player_hand.rank
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

    describe "#discard" do 
        it "should be able to discard a card" do 

        end
    end

    describe "#add" do 
        it "should be able to add a card from the deck" do 

        end
    end

   
end
