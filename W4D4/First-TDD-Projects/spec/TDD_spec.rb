require 'rspec'
require 'TDD'

describe 'Array' do 
  describe '#my_uniq' do

      subject(:arr) { [1, 2, 1, 3, 3] }
      it 'should remove all duplicates' do
          # arr = [1, 2, 1, 3, 3]
          uniq_arr = arr.my_uniq
          expect(uniq_arr).to contain_exactly(1, 2, 3)
      end

      it 'should not modify original array' do
          arr.my_uniq
          expect(arr).to eq(arr)
      end

      it 'should return uniq values in original order' do
          uniq_arr = arr.my_uniq
          expect(uniq_arr).to eq([1, 2, 3])
      end

  end

  describe '#two_sum' do

      subject(:arr) { [-1, 0, 2, -2, 1] }
      it 'should return indices where elements sum to zero' do
          indices = arr.two_sum
          possible_results = [[[2, 3], [0, 4]], [[0, 4], [2, 3]], [[3, 2], [4, 0]], [[4, 0], [3, 2]]]
          expect(possible_results).to include(indices)
      end

      it 'should return indices in dictionary order' do
          indices = arr.two_sum
          expect(indices).to eq([[0, 4], [2, 3]])
      end
  end

  describe "#my_transpose" do 
    subject(:arr) { [[0,1,2], [3,4,5], [6,7,8]]}

    it 'should transpose rows and columns' do 
      transposed = arr.my_transpose 

      expect(transposed).to eq(arr.transpose) 
    end
  end

  describe "#stock_picker" do 
    subject(:stonks) { [100, 300, 400, 100, 500, 800, 50] }

    it "should return the best pair of days for buying and selling stock" do 
      expect(stonks.stock_picker).to contain_exactly(0,5)
    end

    it "should not sell stock before buying it" do 
      expect(stonks.stock_picker).not_to contain_exactly(6,5)
      expect(stonks.stock_picker).not_to be_falsey
    end

    it "should return an array of 2 elements" do 
      expect(stonks.stock_picker.length).to eq(2)
    end
  end

end

