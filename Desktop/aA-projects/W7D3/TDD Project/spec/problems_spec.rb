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
        expect(newArr).to_not be(arr)
    end

    it "should not modify the original array" do 
        expect{newArr}.to_not change{arr}
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
        expect{newArr}.to_not change{arr}
    end


end

describe "my_transpose" do 
    subject(:arr){[[0,1,2],[3,4,5],[6,7,8]]}
    let(:newArr){my_transpose(arr)}

    it "returns an array" do 
        expect(newArr).to be_an_instance_of(Array)
    end

    it "should not modify the original array" do 
        expect{newArr}.to_not change{arr}
    end

    it "should return an array that is transposed" do 
        expect(newArr).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

end