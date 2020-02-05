require 'hand'

describe "hand" do
    subject(:hand){Hand.new}
    let(:card){double("card")}
    let(:hand){double("hand")}

    it "should have 5 cards" do
        expect(hand.hand.length).to eq(5)
    end
end
