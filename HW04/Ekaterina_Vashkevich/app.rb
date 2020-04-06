require_relative 'lib/my_method'

class Array
    include MyMethod
end
  
array = [1, 2, 3, 4, 5]
array.my_each do |i|
    p  i ** 2 
end
 
p rezult = array.my_map {|element| element * 3}
p array.my_map
  
p rezult = array.my_select {|element| element.even?}
p array.my_select
