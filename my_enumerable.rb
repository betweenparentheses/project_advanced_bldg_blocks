module Enumerable
	def my_each
		return self unless block_given?
		counter = 0
		while counter < self.size 
			yield(self[counter])
			counter += 1
		end
		self
	end

	def my_each_with_index
		return self unless block_given?
		counter = 0
		while counter < self.size 
			yield(self[counter], counter)
			counter += 1
		end
		self
	end	

	def my_select
		return self unless block_given?
		new_array = []
		self.my_each do |x|
			new_array << x if yield(x) == true
		end
		new_array
	end

	def my_all?
		all_true = true
		self.my_each do |x|
			if block_given?
				all_true = false if yield(x) == false
			else
				all_true = false if x == false
			end
		end
		all_true
	end

	def my_any?
		any_true = false
		self.my_each do |x|
			if block_given?
				any_true = true if yield(x) == true
			else
				any_true = true if x == true
			end
		end
		any_true
	end

	def my_none?
		none_true = true
		self.my_each do |x|
			if block_given?
				none_true = false if yield(x) == true
			else
				none_true = false if x == true
			end
		end
		none_true
	end

	def my_count
		count = 0
		if block_given?
			self.my_each do |x|
				count +=1 if yield(x) == true
			end
			return count
		else
	end

	def my_map
		self.my_each_with_index do |x, index|
			self[index] = yield(x)
		end
		self
	end

	def my_map(&proc)
		self.my_each_with_index do |x, index|
			self[index] = proc.call(x)
			self[index] = yield(x) if block_given?
		end
		self
	end

	def my_inject (initial = self.first)
		accumulator = initial
		self.my_each do |x|
			accumulator = yield(accumulator, x)
		end
		accumulator
	end
end

def multiply_els(array)
	array.my_inject (1) {|running_multiple, element| running_multiple * element}
end

#[1,2,3,4,5].my_each {|x| puts x}
#["A","B","C","D","E"].my_each_with_index {|x, index| puts "#{x}, #{index}"}
#puts [1,2,3,4,5].my_select {|x| x < 4}
#p [1,2,3,4,5].my_all? {|x| x > 0}
#p [1,2,3,4,5].my_all? {|x| x > 1}
#p [1,2,3,4,5].my_any? {|x| x > 5}
#p [1,2,3,4,5].my_inject {|running_total, x| running_total + x}
#p multiply_els([20,2,-3])

#test = Proc.new{|x| x ** 3}
#puts [1,2,3,4,5].my_map(&test) {|y| y * 2}

puts [false, false, true, false].my_all?