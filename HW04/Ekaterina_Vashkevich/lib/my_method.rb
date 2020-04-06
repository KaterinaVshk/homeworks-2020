# frozen_string_literal: true

# Module contain my implement each, map and select
module MyMethod
    def my_each
      if block_given?
        index = 0
        while index < length
          yield(self[index])
          index += 1
        end
        self
      else
        to_enum(:my_each)
      end
    end
  
    def my_map
      if block_given?
          rezult =[]
          index = 0
          while index < length
            rezult << yield(self[index])
            index += 1
          end
          rezult
        else
          to_enum(:my_map)
      end
    end
  
    def my_select
      if block_given?
          rezult =[]
          index = 0
          while index < length
            rezult << self[index] if yield(self[index])
            index += 1
          end
          rezult
        else
          to_enum(:my_select)
      end
    end
end
  
class Array
  include MyMethod
end