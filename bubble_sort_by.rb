def bubble_sort_by (array)
  sorted = false
  until sorted do
    sorted=true
    (0..array.size-2). each do |x|
      sorted = false if yield(array[x], array[x+1]) < 0
    end
    (0..array.size-2).each do |y|
      if yield(array[y],array[y+1]) < 0 
        array[y+1], array[y] = array[y], array[y+1]
      end
    end
  end
  array
end

print bubble_sort_by(["hi","hello","hey"]) {|left,right| right.length - left.length}

