require 'player'

describe "Player" do 
    let(:player){Player.new}
    let(:hand){double("hand")}
    let(:card){double("card")}

    describe "#intialize" do 

    end

    describe "#make_move" do 
    it "should assume the player chooses valid cards to discard" do 
        expect{card.rank}.to be_between(0,14)
    end

    it "should tell the player to choose again if the cards are not valid" do
        expect{}
    end

end

    describe "#fold" do 
    end

    describe "#call" do 
    end

    describe "#raise" do 
    end


end