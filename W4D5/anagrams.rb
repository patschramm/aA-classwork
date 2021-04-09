def first_anagram?(str1, str2) # O(n!)
    str1.split('').permutation.to_a.include?(str2.split(''))
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2) # O(n)
    str1.each_char do |char|
        if str2.include?(char)
            idx = str2.index(char)
            str2 = str2[0...idx] + str2[idx + 1..-1]
        end
    end 
    str2 == ''
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true



def third_anagram?(str1, str2) # 0(n * log(n))
    str1.chars.sort == str2.chars.sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1, str2) #0(n)
    hash_1 = Hash.new(0)
    # hash_2 = Hash.new(0)
    str1.each_char { |char| hash_1[char] += 1 }
    str2.each_char { |char| hash_1[char] -= 1 }
    
    # hash_1 == hash_2
    hash_1.all? { |k, v| v == 0 }
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true