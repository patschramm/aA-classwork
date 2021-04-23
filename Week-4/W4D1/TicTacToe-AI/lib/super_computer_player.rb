require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  #overwrite the move method
  def move(game, mark)
    #build node from board stored in game CHECK
    node = TicTacToeNode.new(game.board, mark)

    #iterate through children of board, | check if any are winning_node with mark
    #return nodes prev_move_pos
    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end

    #pick node that isn't a losing_node
    node.children.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end


    raise 'No non-losing nodes'
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
