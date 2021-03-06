
def bad_two_sum?(arr, target) #O(n^2)
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end

    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)
    arr.sort!
    arr.each.with_index { |ele, i| return true if arr[i + 1..-1].bsearch { |x| target - ele <=> x } }
    false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target)
    hash = {}
    arr.each do |el|
        if hash[target - el]
            return true
        else
            hash[el] = true 
        end
    end
    false
    # arr.each { |el| hash[el] = true }
    # arr.any? { |el| hash[target - el] && target - el != el } 
end

arr = [0, 1, 5, 7,5]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false