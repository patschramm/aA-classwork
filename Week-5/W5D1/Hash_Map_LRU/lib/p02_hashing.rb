class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, i|
      sum += el.hash * (i+1)
    end 
    sum
  end
end

class String
  def hash
    self.split("").map(&:ord).hash
  end 
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    h = 0
    self.each { |k, v| h = h ^ k.hash ^ v.hash }
    h
  end
end
