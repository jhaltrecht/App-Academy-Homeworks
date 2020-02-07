require 'player'

describe "Player" do 
    let(:player){Player.new("player")}
    let(:hand){double("hand")}
    let(:card){double("card")}

    describe "#intialize" do 
        it "should expect player name to be the assigned name" do
        expect(player.name).to eq("player")
        end

        it "should expect player stack to be 500" do
        expect(player.stack).to eq(500)
        end

    end

    describe "#swap_move" do 
        it "should get the discard count from the player" do
            # expect(swap_move).
        end

    end


    describe "#fold" do 
        it "should call the hand method" do 
            player.fold
            expect(player.active).to be false
        end

    end

    describe "#call" do 
        it "should subtract their stack by amount called" do
            expect {player.call(10)}.to change{player.stack}.by(-10)
        end

        it 'should raise an error if the bet is more than the bankroll' do
      expect{player.call(1000)}.to raise_error{'not enough money'}
        end
    end

        
 

    describe "#raise" do 
        it "should subtract their stack by the raise amount" do
            expect {player.raise(10)}.to change{player.stack}.by(-10)
        end
        

        it 'should raise an error if the bet is more than the bankroll' do
            expect{player.raise(1000)}.to raise_error{'not enough money to raise'}
        end
    end

    describe "#receive" do 
        it "should subtract their stack by the raise amount" do
            expect {player.receive(10)}.to change{player.stack}.by(10)
        end
    end

 


end