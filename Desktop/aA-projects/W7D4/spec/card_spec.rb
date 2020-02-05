require 'card'

describe "Card" do
    subject(:ace){Card.new("Ace","Spades")}
    it "should have a value that is initalized" do
        expect(ace.value).to eq("Ace")
    end

    it "should have a suit that is initialized" do 
        expect(ace.suit).to eq("Spades")
    end

    
end