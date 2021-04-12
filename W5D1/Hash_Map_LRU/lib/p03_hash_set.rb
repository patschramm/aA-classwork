class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key
      @count += 1
      resize! if @count == @store.length 
    end 
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end 
  end

  private

  def [](num)
    @store[num.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = Array.new(@store.length*2) {[]}
    @store.each do |bucket|
      bucket.each do |num|
        arr[num % (@store.length*2)] << num 
      end 
    end 
    @store = arr
  end
end
