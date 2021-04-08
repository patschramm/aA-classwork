require_relative 'cursor.rb'
require_relative 'board.rb'
require 'colorize'

class Display

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def build_row(row, i)
        row.map.with_index do |piece, j|
            pos = [i,j]
            if @cursor.cursor_pos == pos
                # @board[pos].bg_blue
                piece.to_s.colorize(:background => :blue)
            elsif (i.even? && j.odd?) || (j.even? && i.odd?)

                piece.to_s.colorize(:background => :black)
            else

                piece.to_s.colorize(:background => :grey)
            end
        end
    end

    # def set_color(i,j)
    #     if @cursor.cursor_pos == [i,j]
    #         bg = :light_blue
    #     elsif (i.even? && j.odd?) || (j.even? && i.odd?)
    #         bg = :green
    #     else
    #         bg = :white
    #     end 
    #     {background: bg}
    # end

    def build_grid 
        @board.rows.map.with_index {|row, i| build_row(row, i)}
    end

    def render
        build_grid.each {|row| puts row.join("")}
    end

end

a = Board.new
c = Display.new(a)
c.render