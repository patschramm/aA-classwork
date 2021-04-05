require_relative 'PolyTreeNode.rb'
require 'byebug'
class KnightPathFinder

    attr_accessor :root_node, :considered_positions, :start_pos

    MOVES = [[2, 1], [-2, 1], [2, -1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]
        build_move_tree
    end

    def self.valid_moves(pos)
        valid_moves = []
        curr_x, curr_y = pos 
        MOVES.each do |(x, y)|
            new_pos = [curr_x + x, curr_y + y]
            valid_moves << new_pos if new_pos.all? { |n| n >= 0 && n <= 7 }
        end
        valid_moves 
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        valid = moves.reject { |new_pos| @considered_positions.include?(new_pos) }
        valid.each { |new_pos| @considered_positions << new_pos }
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)
        nodes = [root_node]

        until nodes.empty?
            current_node = nodes.shift 
            current_pos = current_node.value 

            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                nodes << next_node
                current_node.add_child(next_node)
            end
        end
    end





end

k = KnightPathFinder.new([0,0])
p k.considered_positions.length