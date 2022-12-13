file_data = File.read("prod.txt")

boxes = [
['B','V','S','N','T','C','H','Q'],
['W','D','B','G'],
['F','W','R','T','S','Q','B'],
['L','G','W','S','Z','J','D','N'],
['M','P','D','V','F'],
['F','W','J'],
['L','N','Q','B','J','V'],
['G','T','R','C','J','Q','S','N'],
['J','S','Q','C','W','D','M']
]
#['number to move','from_box','to_box']
file_data = file_data.split("\n").map! { |x| x[5...x.length]}

directions = [] 
def clean_data(string)
  arr = []

  temp = string.split(" from ")
  arr << temp[0]
  temp = temp[1].split(" to ")
  arr << temp
  arr.flatten.map(&:to_i)
end


file_data.each do |string|
  directions << clean_data(string)
end

directions.each do |direction|
  direction[0].times do |x|
    boxes[direction[2]-1] << boxes[direction[1]-1].pop
  end

end

final = ''
boxes.each do |box|
  final += box.pop
end
p final
