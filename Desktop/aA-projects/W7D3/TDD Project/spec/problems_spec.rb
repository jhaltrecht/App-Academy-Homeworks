require 'rspec'
require 'problems'


describe "my_uniq" do
    subject(:arr){[1,2,3,3,3,4,4,5]}
    let(:newArr){my_uniq(arr)}

    it "returns an array" do 
        expect(newArr).to be_an_instance_of(Array)
    end

    it "removes duplicates" do 
        expect(newArr.all? {|el| newArr.count(el)==1}).to be true
    end

    it "only contains elements from original array" do
        newArr.each {|el| expect(arr).to include(el)}
    end

    it "should return a new array" do
        expect(newArr).not_to be(arr)
    end

    it "should not modify the original array" do 
        expect{newArr}.not_to change{arr}
    end
end

describe "two_sum" do
    subject(:arr){[-1, 0, 2, -2, 1]}
    let(:newArr){arr.two_sum}
    let(:arr2){[-1, 0, 2, -2, 1,0]}
    let(:newArr2){arr2.two_sum}


     it "returns an array" do 
        expect(newArr).to be_an_instance_of(Array)
    end

    it "returns an array where elements per position sum to 0" do 
        expect(newArr).to eq([[0,4],[2,3]])
    end

    it "is not confused by 1 zero" do
        expect(newArr).to eq([[0,4],[2,3]])
    end

    it "returns a 3d array with arrays of length 2" do
        expect(newArr.all? {|row|row.length==2}).to be true
    end
    
    it "is not confused by two zeros" do
    expect(newArr2).to eq([[0,4],[1,5],[2,3]])
    end

    it "returns arrays where smaller first elements come first" do
        expect(newArr.each_with_index.all? do |positionsArr,idx|
            positionsArr.each_with_index do |position,posIdx|
                newArr[posIdx..-1].min==positionsArr 
            end
        end).to be true
    end

    it "should not modify the original array" do 
        expect{newArr}.not_to change{arr}
    end


end

describe "my_transpose" do 
    subject(:arr){[[0,1,2],[3,4,5],[6,7,8]]}
    let(:newArr){my_transpose(arr)}

    it "returns an array" do 
        expect(newArr).to be_an_instance_of(Array)
    end

    it "should not modify the original array" do 
        expect{newArr}.not_to change{arr}
    end

    it "should return an array that is transposed" do 
        expect(newArr).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

end

describe "stock_picker" do 
    subject(:arr){[3,2,5,6,9]}
    let(:newArr){stock_picker(arr)}

    it "returns an array of length 2" do 
        expect(newArr.length).to eq(2)
    end

    it "should not modify the original array" do 
        expect{newArr}.not_to change{arr}
    end

    it "should output the best day to buy and sell each stock" do 
        expect(newArr).to eq([1,4])
    end

    it "does not buy stocks if it only goes down" do 
        expect(stock_picker([5, 4, 3, 2, 1])).to be_nil
    end

end

describe "TowersOfHanoiGame" do
    subject(:disks) { TowersOfHanoiGame.new }
    # array assigned will be [[1,3],[],[4,5,7]]}
    describe "#move" do 
        let(:result){disks.move(0,2)}
        it "should raise an error if you try to move a bigger object on a smaller one" do
            expect{disks.move(2,0)}.to raise_error("can't move a bigger object on top")
        end

        it "allows you to move a smaller object on top of a bigger one" do 
            expect{disks.move(0,2)}.not_to raise_error
        end

        it "allows moving to a blank space" do
            expect { disks.move(0, 1) }.not_to raise_error
        end

         it "does not allow moving from a blank space" do
            expect { disks.move(1, 2) }.to raise_error("can't move from a blank space")
        end
        
        it "should modify the original array" do 
            expect{result}.to change{disks}
        end
    end
    describe "#won?" do
        it "should know when the game is won" do 
            disks.move(2,1)
            disks.move(2,1)
            disks.move(2,1)
            disks.move(0,1)
            disks.move(0,1)
            expect(disks.won).to be true
        end
        it "should know when the game is not won and not be won at the start" do 
            expect(disks.won).not_to be true
        end
    end

        
    


end