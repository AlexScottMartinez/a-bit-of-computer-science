
def fibs(num, answer = [])
  # Loop through 0 to num-1 times
  (0..num - 1).each do |i|
    # if the length of the answer array is less than 2, then append i to the answer array.
    #   This is for the answer to start with [0,1]
    if answer.length < 2
      answer << i
    # else append the sum of the two previous appending answers to the answer array.
    #   Ex: [0,1] => [0,1,1]
    else
      answer << answer[-2] + answer[-1]
    end
  end
  answer
end


def fibs_rec(num, answer = [])
  # if the num is less than or greater than 2, then loop through 0 to num times appending it to the answer array
  if num <= 2
    (0...num).each {|i| answer << i}
    return answer
  end
  # recursion function call which will cycle through one less than the number inputted. Thats
  #   because the arrays always start with position 0.
  answer = fibs_rec(num - 1)
  # append the sum of the two previous appending answers to the answer array.
  answer << answer[-2] + answer[-1]
end


def merge_sort(arr)
  # see whether the arr inputed is one one element, because that would mean it is already sorted
  if arr.length < 2
    return arr
  end

  # splits the array into two evenly
  mid = arr.length / 2
  # left side of the splitted array
  left = merge_sort(arr[0...mid])
  # right side of the splitted array
  right = merge_sort(arr[mid...arr.length])
  # variable that stores the sorted array
  sorted = []

  # when one of the splitted arrays is empty, then compare the left value against the right value
  #   and if true then append the left value to the answer array. Otherwise append the right value
  #   to the answer array.
  until left.empty? || right.empty?
    left.first <= right.first ? sorted << left.shift : sorted << right.shift
  end
  # add all the arrays together into a single array
  sorted + left + right
end



puts "Iterative -> #{fibs(8)}"

puts "Recursive -> #{fibs_rec(8)}"

puts "Merge-sort -> #{merge_sort([3,2,1,13,8,5,0,1])}"
