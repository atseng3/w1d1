# require 'debugger'
class Array
	def my_uniq
		new_arr = []
		self.each do |element|
			new_arr.push(element) unless new_arr.include?(element)
		end
		return new_arr
	end

	def two_sum
		zero_pairs = []
#    debugger
		self.each_with_index do |element1, index1|

      unless index1 == self.length-1

	      self[(index1+1)..self.length-1].each_with_index do |element2, index2|

          if element1 +  element2 == 0
            zero_pairs.push([index1, index2 + (index1+1)])

          end
        end
      end
		 end
    zero_pairs
	end

  def my_transpose
    transposed = []

    self.each_with_index do |row|
      row.each_with_index do |element, index|
        if transposed[index].nil?
          transposed.push([element])
        else
          transposed[index].push(element)
        end
      end
    end
    transposed
  end
end

# test = [1,2,1,3,3]
# puts "my uniq is working because test.uniq == test.my_uniq: #{test.uniq == test.my_uniq}"

def stock_picker(stock_prices)
  final_buy_date = 0
  final_sell_date = 0
  max_profit = 0
  stock_prices.each_with_index do |buy_price, buy_date|
    stock_prices.each_with_index do |sell_price, sell_date|
      if sell_price - buy_price > max_profit and sell_date > buy_date
        max_profit = sell_price - buy_price
        final_buy_date = buy_date
        final_sell_date = sell_date
      end
    end
  end
  [final_buy_date, final_sell_date]
end

class TowersOfHanoi
  def initialize
    @towers = [[3,2,1],[],[]]
    @move_counter = 0
    greeting
  end

  def greeting
    puts "Welcome to Hanoi!"
    turn
  end

  def turn
    until win?
      display

      puts "Select the tower to move disks from: [0, 1, 2]"
      from = gets.chomp.to_i

      puts "Select the tower to move disks to: [0, 1, 2]"
      to = gets.chomp.to_i

      move(from,to)

    end
  end

  def display
    p @towers
  end

  def win?
    if @towers == [[],[],[3,2,1]]
      puts "You solved the towers in #{@move_counter} moves!"
      true
    end
  end

  def move(from, to)

    if from < 0 || from > 3 || to < 0 || to > 3
      puts "Invalid move.  Must select a tower within the correct range."
      return false
    elsif @towers[from].last.nil?
      puts "Invalid move.  Must select a tower that contains an element."
      return false
    elsif !@towers[to].last.nil? && @towers[from].last > @towers[to].last
      puts "Invalid move.  Can't put a bigger disk on a smaller disk."
      return false
    elsif from == to
      puts "Invalid move. Must move from one tower to another."
      return false
    end

    @towers[to] << @towers[from].pop
    @move_counter += 1
    return true
  end


end