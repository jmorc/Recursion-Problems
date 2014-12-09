require 'debugger'

if __FILE__ == $PROGRAM


end

def range(start, finish)
  if start > finish
    []
  else
    range(start, finish - 1) << finish
  end
end

def recursive_sum(arr)
  if arr.empty?
    0
  else
    arr[-1] + recursive_sum(arr[0...-1])
  end
end

def iterative_sum(arr)
  arr.inject(0){ |accum, item| accum + item }
end

def expo(base, ex)
  if ex == 0
    1
  else
    base * expo(base, ex - 1)
  end
end

def expo2(base, ex)
  if ex == 0
    1
  elsif ex.even?
    expo2(base, ex / 2) * expo2(base, ex / 2)
  else 
    base * expo2(base, (ex - 1) / 2) * expo2(base, (ex - 1) / 2)
  end
end

class Array
  
  def deep_dup
    new_array = []
    self.each do |i|
      if i.is_a?(Array)
        new_array << i.deep_dup
      else
        new_array << i
      end
    end
    new_array
  end
end

def fibonacci(n)
  if n == 1
    [0]
  elsif n == 2
    [0, 1]
  else
    old_fibs = fibonacci(n - 1)
    old_fibs << old_fibs[-1] + old_fibs[-2]
  end
end

def it_fib(n)
  fib = [0, 1]
  n.times do 
    next_fib = fib[-2] + fib[-1]
    fib << next_fib
  end
  fib[0...n]
end


def my_bsearch(array, target)
  return nil if array.empty?
  
  middle_el = array[array.length / 2]
  middle_idx = array.length / 2
  array = [] if array.length == 1
  
  if target == middle_el
    middle_idx
  elsif target < middle_el
    my_bsearch(array.take(middle_idx), target)
  else
    maybe_nil_or_index = my_bsearch(array.drop(middle_idx + 1), target)
    maybe_nil_or_index.nil? ? nil : middle_idx + 1 + maybe_nil_or_index
  end
end

# p bsearch([1,2,3,5,7, 13, 65, 100], 94)

def make_change(amt, coins)
  solutions = []
  return [] if amt == 0
  coins.each_with_index do |coin, i|
    next if coin > amt
    leftover_change = amt - coin
    best_change     = make_change(leftover_change, coins[i..-1])
    best_change.unshift(coin)
    solutions << best_change
  end
  solutions.min_by(&:length)
end

def merge(arr1, arr2)
  merged_arr = []
  
  until arr1.empty? || arr2.empty?
    if arr1.first > arr2.first
      merged_arr << arr2.shift
    else
      merged_arr << arr1.shift
    end
  end
  merged_arr + arr1 + arr2
end
  
def merge_sort(arr)
  if arr.length < 2
    return arr
  end
  
  length = arr.length
  index = length / 2 
  
  arr1 = arr.take(index)
  arr2 = arr.drop(index)

  sorted_arr1 = merge_sort(arr1)
  sorted_arr2 = merge_sort(arr2)
  merge(sorted_arr1, sorted_arr2)
end

# arr = [4, 3, 6, 5, 18]
# merge_sort(arr)
#p make_change(14, [10, 7, 1])
#p bsearch([1,2,3,5,7, 13, 65, 100], 94)

#p it_fib(15)

# p fibonacci(5)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(10)

# arr = [1, [2], [3, [4]]]
# arr1 = arr.deep_dup
# arr1[0] = 0
# p arr1
# p arr

# p range(1, 10)
#p recursive_sum([1,2,3,4,2])
#p iterative_sum([1,2,3,4,2])
#p expo2(3,3)