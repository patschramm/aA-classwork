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
end