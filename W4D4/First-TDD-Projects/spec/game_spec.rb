require 'rspec'
require 'game'

describe Game do 
  subject(:game) { Game.new }
  
  describe "#initialize" do 
    it "contain Board class in @board" do 
      expect(game.board).to be_an_instance_of(Board)
    end

    it "should instantiate game" do 
      expect(Game.new).to be_an_instance_of(Game)
    end
  end

  describe "#game_over?" do 
    context "when game is over" do 
      it "should return true" do
        game.board.towers[2] = [1, 2, 3, 4]
        game.board.towers[0] = []

        expect(game.game_over?).to be true 
      end
    end

    context "when game is not over" do 
      it "should return false" do 
        game.board.towers[2] = [1,2, 4]
        game.board.towers[0] = [3]

        expect(game.game_over?).to be false
      end
    end
  end

  describe "#run" do 
    it "should "


  end

end