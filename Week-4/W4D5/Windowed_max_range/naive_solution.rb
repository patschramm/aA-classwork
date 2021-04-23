def windowed_max_range(arr, w)
    curr_max_range = nil
    (0..arr.length - w).each do |i|
        sub = arr[i...i + w]
        diff = sub.max - sub.min
        curr_max_range = diff if !curr_max_range || diff > curr_max_range
    end

    curr_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
