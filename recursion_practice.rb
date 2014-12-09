def range(start, end_val)
  return [] if start > end_val
  return [start] if start == end_val
  my_range = range(start, end_val - 1) << end_val
end

# p range(4, 14)

def exp1(b, n)
  return 1 if n == 0
  my_val = b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  return exp2(b, n / 2) * exp2(b, n / 2)  if n.even?
  if n.odd?
    b * exp2(b, (n - 1) / 2) * exp2(b, (n - 1) / 2)
  end
end

class Array
  def deep_dup
    return [] if self.empty?
    deep_dup_arr = []
    each do |el|
      if el.is_a?(Array)
        deep_dup_arr << el.deep_dup 
      else
        deep_dup_arr << el
      end
    end
    deep_dup_arr
  end
end

def fibonaccis(n)
  return [0] if n == 1
  return [0, 1]if n == 2
  sequence = []
  last_nums = fibonaccis(n - 1)
  new_num = last_nums[-2] + last_nums[-1]
  fib = last_nums << new_num
end

# p fibonaccis(10)

def binary_search(arr, target)
  return 0 if arr.count == 1 && target == arr[0]
  return nil if arr.count == 1 && target != arr[0]
  midpoint = arr.count / 2
  if arr[midpoint] == target
    return midpoint
  elsif target > arr[midpoint]
    right_half = arr.drop(midpoint)
    bsearch_result = binary_search(right_half, target)
    return nil if bsearch_result.nil? 
    result = binary_search(right_half, target) + midpoint
    return result
  elsif target < arr[midpoint]
    left_half = arr.take(midpoint)
    binary_search(left_half, target)
  end
end
    

arr = [1, 3, 4, 5, 7, 8]
p binary_search(arr, 6)
  
  
  
  