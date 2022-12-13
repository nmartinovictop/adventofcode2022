file_data = File.read("prod.txt")

split_data = file_data.split("\n").map! { |x| x.split(",")}

#"2-4,6-8"

# get an array of each int in each item
# subtract one array from the other
# if the length of the result is 1.length -2.length then it works


def build_list(string)
  split_string = string.split("-").map(&:to_i)
  return_list = []
  (split_string[0]..split_string[1]).each do |ele|
    return_list << ele
  end
  return_list
end

def compare_items(block)
  list0 = build_list(block[0])
  list1 = build_list(block[1])

  if (list0 - list1).length < list0.length
    return true
  elsif (list1 - list0).length < list1.length
    return true
  else
    return false
  end

end
counter = 0
split_data.each do |ele|
  if compare_items(ele)
    counter += 1
  end
end

p counter