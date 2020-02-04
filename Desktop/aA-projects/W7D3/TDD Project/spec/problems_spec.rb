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

    it "should not modify old array" do 
        expect{newArr}.to_not change{arr}
    end
end

describe "two_sum" do
    subject(:arr){[-1, 0, 2, -2, 1]}
    let(newArr){two_sum(arr)}
    
     it "returns an array" do 
        expect(newArr).to be_an_instance_of(Array)
    end


end

