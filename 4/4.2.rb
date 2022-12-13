file_data = File.read("prod.txt")

split_data = file_data.split("\n")
UPPERLETTERS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
data_groupings = []

while split_data.length >= 1
  data_groupings << split_data.slice!(0..2)

end

def build_hashes(group_of_arrays)
  return_array = []
  group_of_arrays.each do |ele|
    hash = Hash.new(0)
    ele.each_char do |char|
      if hash[char] > 1
        next
      else
        hash[char] += 1
      end
    end
    return_array << hash.keys
  end

  return_array
end


def find_common_letters(group_of_arrays)
  hash = Hash.new(0)
  group_of_arrays.each do |ele|
    ele.uniq.each do |char|
      hash[char] += 1
    end
  end

  UPPERLETTERS.index(hash.key(3))+1
end

score = 0

data_groupings.each do |ele|
 score += find_common_letters(build_hashes(ele))

end

p score