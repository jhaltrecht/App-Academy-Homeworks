require 'hand'

describe "Hand" do
    subject (:player_hand){Hand.new(card1,card2,card3,card4,card5)} 
    let(:card1){double("card1")}
    let(:card2){double("card2")}
    let(:card3){double("card3")}
    let(:card4){double("card4")}
    let(:card5){double("card5")}
    it "should have 5 cards" do
        unless player_hand.hand.length==5
        expect{player_hand}.to raise_error("hand does not have 5 card")
        end
    end
    
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

    it "should know if an unpaired hand is better than another unpaired hand" do
        player_hand.hand=[]
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
