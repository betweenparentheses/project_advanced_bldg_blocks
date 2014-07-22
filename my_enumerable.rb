module Enumerable
	def my_each
		counter = 0
		while counter < self.size 
			yield(self[counter])
			counter += 1
		end
		self
	end

	def my_each_with_index
		counter = 0
		while counter < self.size 
			yield(self[counter], counter)
			counter += 1
		end
		self
	end	

	def my_select
		new_array = []
		self.my_each do |x|
			new_array << x if yield(x) == true
		end
		new_array
	end

	def my_all?
		all_true = true
		self.my_each do |x|
			all_true = false if yield(x) == false
		end
		all_true
	end

	def my_any?
		any_true = false
		self.my_each do |x|
			any_true = true if yield(x) == true
		end
		any_true
	end

	def my_none?
	end

	def my_count
	end

	def my_map
	end

	def my_inject
	end

	def multiply_els
	end
end

#[1,2,3,4,5].my_each {|x| puts x}
#["A","B","C","D","E"].my_each_with_index {|x, index| puts "#{x}, #{index}"}

#puts [1,2,3,4,5].my_select {|x| x < 4}

#p [1,2,3,4,5].my_all? {|x| x > 0}
#p [1,2,3,4,5].my_all? {|x| x > 1}

#p [1,2,3,4,5].my_any? {|x| x > 5}
#p [1,2,3,4,5].my_any? {|x| x > 4}

