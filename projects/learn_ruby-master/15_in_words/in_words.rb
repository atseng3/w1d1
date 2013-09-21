#require 'debugger'
class Fixnum

  def places
    places = { "trillion" => 1_000_000_000_000, "billion" => 1_000_000_000,
               "million"=>1_000_000, "thousand" => 1000}
  end

  def numbers
    numbers = {
      0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety"
     }
  end


  def in_words
    return "zero" if self == 0
    in_words = ""
    num_array = self.splitter
    #debugger
    places.each do |key, value|
      if num_array.first == 0
        num_array.shift
      elsif value <= self &&
        in_words << segment_to_word(num_array.shift) + " " + key + " "
      end
    end
    #debugger
    in_words << segment_to_word(num_array.first)
    in_words.chomp(' ')
    # in_words
  end

  def splitter
    num = self.to_s
    remainder = num.length % 3
    steps = num.length / 3
    numbers = num
    result = []
    upper = num.size - 1
    lower = upper - 2

    steps.times do
      result << numbers[lower..upper].to_i
      lower-=3
      upper-=3
    end

    if remainder != 0
        result << numbers[0...remainder].to_i
    end

    return result.reverse
  end

=begin
  def splitter
    return [self] if self < 1000
    num = self
    result = []
    places.each_value do |place|

      if num % place != num                       ## num = 1000
        #debugger
        remainder = num % place                   ## remainder = 0
        num2 = num.to_s.split('')                 ## num2 = [1,0,0,0]
        3.times { num2.pop }  ## pop 3 times
        result << num2.join.to_i                  ## append 123 to result
        num = remainder                           ## making num 456 and repeat
        result << num if num < 1000               ## append 456 if less than 1000
      end

    end
    result
  end
=end

  def segment_to_word(num_segment)
    # debugger
    return "" if num_segment == 0
    word = ""
    hundreds = num_segment / 100
    tens = num_segment - hundreds * 100
    if hundreds > 0
      word += "#{numbers[hundreds]} hundred "
    end
    if numbers.has_key?(tens)
      word += "#{numbers[tens]}"
    else
      ones = tens % 10
      tens -= ones
      word += "#{numbers[tens]} #{numbers[ones]}".chomp(' ')
    end
    word
  end



end