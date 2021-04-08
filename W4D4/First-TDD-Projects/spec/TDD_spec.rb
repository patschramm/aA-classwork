require 'rspec'
require 'TDD'

describe 'Array#uniq' do
    it 'should remove all duplicates' do
        arr = [1, 2, 1, 3, 3]
        uniq_arr = arr.uniq
        expect(uniq_arr).to eq([1, 2, 3])
    end
end