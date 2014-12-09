def subsets(arr)
  return [[]] if arr.empty?
  subs      = subsets(arr[0..-2])
  subs_plus = subs.map { |el| el + [arr.last] }
  subs.concat(subs_plus)
end

p subsets([1])
p subsets([1, 2])
p subsets([1, 2, 3])