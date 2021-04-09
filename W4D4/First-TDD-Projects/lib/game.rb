require_relative './board.rb'

class Game
  attr_reader :board
  def initialize 
    @board = Board.new
  end

  def game_over?
    board.over?
  end


end