class Array
  def sorted?
    sorted = true
    (0..self.size-2).each do |element|
      sorted = false if self[element + 1] < self[element]
    end
    sorted
  end
end

def bubble_sort (array)
  until array.sorted? do
    (0..array.size-2).each do |y|
      if array[y] > array[y+1]
        array[y+1], array[y] = array[y], array[y+1]
      end
    end
  end
  array
end

print bubble_sort([4,3,78,2,0,2])
