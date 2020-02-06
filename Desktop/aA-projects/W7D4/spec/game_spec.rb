require 'game'

describe "Game" do 
    

subject(:game){Game.new}

    

   

    describe "#initialize" do
        it 'should start with a deck' do
            expect(game.deck).to be_a(Deck)
        end
        it 'should start with a full deck' do
            expect(game.deck.length).to eq(52)
        end
    end

    describe "#turn" do
        it "should keep track of whose turn it is"do 

        end
    end
    describe "#pot" do
        it "should keep track of the amount in the pot" do
            expect(game.pot).to be_an_instance_of(Game)
        end
    end

    describe "#add_player" do
        it "should add the player to the players array" do
            game.add_player
            expect(game.players.length).to eq(3)
        end

        it "should add the players name " do
            let(:player){double("player")}
            expect(player).to receive(:name).with("Phil Helmuth")
            game.add_player("Phil Helmuth")
            en
        end
    end
end