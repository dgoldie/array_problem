require 'spec_helper'

describe ArrayUtils do

  describe "#new" do
    
    it "takes an array and returns a util object" do 
      expect(ArrayUtils.new([1,2,3])).to be_an_instance_of ArrayUtils
    end

    it "raises an error when input isn't an array" do
    	expect {ArrayUtils.new("bad input") }.to raise_error(ArgumentError)
    end

  end

  describe "#sort_and_fill" do

    it "takes a short array and returns the same array" do
      short_arrays = [ [], [1], [1,2], [1,2,3,4,5] ]
      short_arrays.each do |input|
        expect(ArrayUtils.new(input).sort_and_fill).to eq input
      end
    end

    it "fills array with one missing element" do
      ary = [1, 3, 5, 9, 11, 13]
      expect(ArrayUtils.new(ary).sort_and_fill).to eq [1, 3, 5, 7, 9, 11, 13]
    end

    it "fills array with multiple missing elements" do
      ary = [1, 3, 5, 9, 11, 13, 17]
      expect(ArrayUtils.new(ary).sort_and_fill).to eq [1, 3, 5, 7, 9, 11, 13, 15, 17]
    end


    it "sorts and fills unsorted array with multiple missing elements" do
      ary = [13, 17, 1, 5, 9, 11, 3 ]
      expect(ArrayUtils.new(ary).sort_and_fill).to eq [1, 3, 5, 7, 9, 11, 13, 15, 17]
    end


    it "sorts and fills array with missing elements in other sequence" do
      ary = [5, 10, 15, 25, 30 ]
      expect(ArrayUtils.new(ary).sort_and_fill).to eq [5, 10, 15, 20, 25, 30 ]
    end
  end

end