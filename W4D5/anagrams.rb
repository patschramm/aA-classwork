def first_anagram?(str1, str2) # O(n!)
    str1.split('').permutation.to_a.include?(str2.split(''))
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2) # O(n)
    str1.each_char do |char|
        if str2.include?(char)
            idx = str2.index(char)
            str2 = str2[0...idx] + str2[idx + 1..-1]
        end
    end 
    str2 == ''
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

