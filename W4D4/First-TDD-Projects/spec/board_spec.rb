require 'rspec'
require 'board'

describe Board do
    subject(:board) { Board.new }

    describe '#initialize' do
        it 'should contain @towers' do
            expect(board.towers).to be_an_instance_of(Array)
        end
        
        it 'should instantiate board' do
            expect(board).to be_an_instance_of(Board)
        end
    end

    describe '#fill' do
        it 'should set initial tower with four discs' do
            board.fill
            expect(board.towers[0]).to eq([1, 2, 3, 4])
        end
    end

    describe '#make_move' do
        it 'should move a disc to another tower' do
            board.make_move(0, 1)
            expect(board.towers[0].length).to eq(3)
            expect(board.towers[1].length).to eq(1)
        end

        it 'should call #valid_move?' do
            allow(board).to receive(:valid_move?).and_return(true)
            expect(board.make_move(1, 2)).to be true
        end

        it 'should raise an error if a disc is trying to move on top of a smaller disc' do
            board.make_move(0, 1)
            expect{board.make_move(0, 1)}.to raise_error('invalid move')
        end
    end

    describe "#valid_move?" do 
      context "when move is valid" do 
        it "should return true" do 
          expect(board.valid_move?(0, 1)).to eq true 
        end
      end

      context "when move is invalid" do 
        it "should return false" do 
          board.make_move(0,1)
          expect(board.valid_move?(0, 1)).to eq false 
        end
      end


    end
end