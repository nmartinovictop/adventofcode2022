file_data = File.read("prod.txt").split("\n").map { |x| x.split("")}

file_data.each do |ele|
  ele.map!(&:to_i)
end



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
  looker_x = forest.length-1
  if x == looker_x
    return true
  end

  highest_tree = forest[looker_x][y]

  while looker_x > (x)
    
    if forest[looker_x][y] > highest_tree
      highest_tree = forest[looker_x][y]
    end
    looker_x -= 1
  end

  if forest[x][y] <= highest_tree
    return false
  else
    return true
  end

end



def vis_from_left(x,y,forest)
  if y == 0
    return true
  end

  looker_y = 0
  highest_tree = forest[x][looker_y]

  while looker_y < (y-1)
    looker_y += 1
    if forest[x][looker_y] > highest_tree
      highest_tree = forest[x][looker_y]
    end

  end

  if forest[x][y] <= highest_tree
    return false
  else
    return true
  end



end

def vis_from_right(x,y,forest)
  looker_y = forest[x].length-1
  if y == looker_y
    return true
  end

  highest_tree = forest[x][looker_y]

  while looker_y > (y)
    
    if forest[x][looker_y] > highest_tree
      highest_tree = forest[x][looker_y]
    end
    looker_y -= 1
  end

  if forest[x][y] <= highest_tree
    return false
  else
    return true
  end

end


def visible(x,y,forest)

  if vis_from_top(x,y,forest) || vis_from_bottom(x,y,forest) || vis_from_left(x,y,forest) || vis_from_right(x,y,forest)
    return true
  end

end

counter = 0

file_data.each_with_index do |ele_x,x_idx|
  ele_x.each_with_index do |ele_y, y_idx|
    if visible(x_idx,y_idx,file_data)
      counter += 1
    end
  end
end


p counter
# [
#   [3, 0, 3, 7, 3], 
#   [2, 5, 5, 1, 2], 
#   [6, 5, 3, 3, 2], 
#   [3, 3, 5, 4, 9], 
#   [3, 5, 3, 9, 0]
# ]
