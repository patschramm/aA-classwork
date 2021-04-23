require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return board.won? && board.winner != evaluator
    elsif next_mover_mark == evaluator
      return children.all? { |child| child.losing_node?(evaluator) }
    else
      return children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    elsif next_mover_mark == evaluator
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0..2).each do |row_idx|
        (0..2).each do |col_idx|
            # debugger 
            pos = [row_idx, col_idx] 
            if board.empty?(pos)
                dupped_board = board.dup 
                dupped_board[pos] = next_mover_mark
                next_mover_mark = self.next_mover_mark == :x ? :o : :x
                children << TicTacToeNode.new(dupped_board, next_mover_mark, pos)
            end
        end
    end
    children
  end
end
