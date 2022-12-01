file_data = File.read("prod.txt")

split_data = file_data.split("\n")

dict = Hash.new(0)

elf = 1
split_data.each do |ele|
  if ele == ""
    elf += 1
    next
  else
    dict[elf] += ele.to_i
  end

end

max_value = 0

dict.each do |k,v|
  if v > max_value
    max_value = v
  end
end

p max_value