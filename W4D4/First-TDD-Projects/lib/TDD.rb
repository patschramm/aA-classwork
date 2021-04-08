class Array

    def my_uniq
        uniq_arr = []
        self.each { |el| uniq_arr << el unless uniq_arr.include?(el) }
        uniq_arr
    end

    def two_sum
        new_arr = []
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                if i < j && self[i] + self[j] == 0
                    new_arr << [i, j]
                end
            end
        end

        new_arr
    end

    def my_transpose
      transposed = self.dup 

      length.times do |i|
        (0...i).each do |j|
          transposed[i][j] = self[j][i]
        end
      end

      transposed
    end

    def stock_picker 
      max = [0,0]


      (0...length-1).each do |i|
        (0...length).each do |j|
          if j > i && self[j] > self[i]
            diff = self[j] - self[i]
            max_diff = self[max[1]] - self[max[0]]
            max = [i,j] if diff > max_diff
          end
        end
      end

      max
    end
end