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

        it 'should set up an empty pot to track' do
            expect(game.pot).to eq(0)
        end
    end

    describe "#turn" do
        context "should keep track of whose turn it is"do 
            it "should start with the first player added" do
                game.add_player("player1")
                game.add_player("player2")
                expect(game.player_name(0)).to eq("player1")
            end
        end
     
    end

    describe "#change_turn" do 
      it "should change to the next player's turn" do
            game.add_player("player1")
            game.add_player("player2")
            game.change_turn
            expect(game.player_name(0)).to eq("player2")
        end
    end
    describe "#add_to_pot" do
        it 'should add the amount to the pot' do
            pot=game.pot
            expect(game.add_to_pot(100)).to eq(pot+100)
    end
    end

    describe "#add_player" do
        it "should add the player to the players array" do
            game.add_player("name")
            expect(game.players.length).to eq(1)
        end
    end
            let(:player){double("player")}

    describe "#player_name" do 
        it "should let you get the players name without having to call '.name' on the player class" do
            game.add_player("name")
            expect(game.player_name(0)).to eq(game.players[0].name)
        end
    end
end