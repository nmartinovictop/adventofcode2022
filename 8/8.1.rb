file_data = File.read("test.txt").split("\n").map { |x| x.split("")}

file_data.each do |ele|
  ele.map!(&:to_i)
end

# [
#   [3, 0, 3, 7, 3], 
#   [2, 5, 5, 1, 2], 
#   [6, 5, 3, 3, 2], 
#   [3, 3, 5, 4, 9], 
#   [3, 5, 3, 9, 0]
# ]


#[3][4]
def vis_from_top(x,y,forest)
  looker_x = 0
  if x == 0
    return true
  end

  highest_tree = forest[looker_x][y]

  while looker_x < (x-1)
    looker_x += 1
    if forest[looker_x][y] > highest_tree
      highest_tree = forest[looker_x][y]
    end

  end

  if forest[x][y] <= highest_tree
    return false
  else
    return true
  end

end

def vis_from_bottom(x,y,forest)
  looker_x = (forest.length - 1)
  if x == looker_x
    return true
  end

  highest_tree = forest[looker_x][y]

  while looker_x >= (x+1)
    looker_x -= 1
    if forest[looker_x][y] > highest_tree
      highest_tree = forest[looker_x][y]
    end

  end

  if forest[x][y] <= highest_tree
    return false
  else
    return true
  end

end

p vis_from_bottom(3,2,file_data)