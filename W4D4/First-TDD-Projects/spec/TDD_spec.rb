require 'rspec'
require 'TDD'

describe 'Array#my_uniq' do

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

describe 'Array#two_sum' do

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