def multiply_by_two(integers)
  integers.map { |i| i * 2 }
end

class Array
  def my_each
    counter = 0
    while counter < self.length
      yield (self[counter])
      counter += 1
    end
    self
  end
end

def median(integers)
  integers.sort!
  if integers.length % 2 != 0
    return integers[integers.length / 2]
  else
    return (integers[integers.length / 2] + integers[integers.length / 2 - 1]).to_f / 2
  end
end

def concatenate(ary)
  ary.inject(""){|result, string| result += string}
end