def my_min1(arr)  # O(n^2)
    min = arr[0]
    arr.each do |i|
        arr.each do |j|
            min = i if i < j && i < min
        end
    end
    min
end


def my_min2(arr) # O(n)
    min = arr[0]
    arr.each { |ele| min = ele if ele < min }
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5


# def largest_contiguous_subsum(arr)
#     sub_arrs = subarr(arr)
#     sub_arrs.map! { |sub| sub.sum }.max
# end

# def subarr(arr)
#     subs = []

#     0.upto(arr.length - 1).each do |i|
#         (i...arr.length).each do |j|
#             subs << arr[i..j]
#         end
#     end

#     subs
# end

def largest_contiguous_subsum(arr) 
    largest_sum = arr.max
    # pop_arr = arr[0...-1]
    # shift_arr = arr.drop(1)
    
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])