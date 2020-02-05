require 'card'

describe "Card" do
    context "#initialize"
    subject(:ace){Card.new("A","♠")}
    it "should have a value that is initalized" do
        expect(ace.value).to eq("A")
    end

    it "should have a suit that is initialized" do 
        expect(ace.suit).to eq("♠")
    end
    context "must have appropriate suit and face value" do
        let(:ace_suit){Card.new("A","O")}
        let(:ace_value){Card.new("Ace","♠")}

        
        it "should only have suits of ♠,♥,♣,♦" do
            suits=["♠","♥","♣","♦"]
            expect{ace_suit}.to raise_error("invalid suit") unless suits.include?(ace.suit)
        end

        it "should only have cards from 2 through Ace" do
            faces=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
            expect{ace_value}.to raise_error("invalid face value") unless faces.include?(ace.value)
        end
    end

    
end