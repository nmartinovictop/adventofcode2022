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

elf_list = []

dict.each do |k,v|
  elf_list << v
end

new_list = elf_list.sort.reverse
p new_list[0]+new_list[1]+new_list[2]