require 'deck'
require 'byebug'

describe "Deck" do
    subject(:deck){Deck.new}
    describe "#initialize" do
        it "should have 52 cards" do
            expect(deck.cards.length).to eq(52)
        end

        it "should have 13 cards per suit" do
            count=Hash.new(0)
            deck.cards.each do|card|
                suit=card.suit
                count[suit]+=1
            end
            count.each_key {|suit| expect(count[suit]).to eq(13) }
        end

        it "should have 4 suits" do 
            count=Hash.new(0)
            deck.cards.each do|card|
                suit=card.suit
                count[suit]+=1
            end
            expect(count.keys.length).to eq(4)
        end
    end

    it "should be able to shuffle the cards" do 
        original_cards=deck.cards.dup
        expect(original_cards).to_not eq(deck.shuffle!)
    end
    
end