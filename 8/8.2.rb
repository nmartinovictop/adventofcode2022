file_data = File.read("prod.txt").split("\n").map { |x| x.split("")}

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


def vis_top(x,y,forest) #(2,2) ==> 1

  counter = 0
  if x == 0
    return counter
  end

  max_tree = forest[x][y]
  searcher = true

  while searcher && x > 0
    x -= 1
    counter += 1
    if forest[x][y] >= max_tree
      searcher = false
    end



  end



  return counter
end


def vis_bottom(x,y,forest)

  counter = 0
  if x == forest.length-1
    return counter
  end

  max_tree = forest[x][y]
  searcher = true

  while searcher && x < forest.length-1
    x += 1
    counter += 1
    if forest[x][y] >= max_tree
      searcher = false
    end



  end



  return counter
end


def vis_right(x,y,forest)

  counter = 0
  if y == forest[x].length-1
    return counter
  end

  max_tree = forest[x][y]
  searcher = true

  while searcher && y < forest[x].length-1
    y += 1
    counter += 1
    if forest[x][y] >= max_tree
      searcher = false
    end



  end



  return counter
end

def vis_left(x,y,forest) #(2,2) ==> 1

  counter = 0
  if y == 0
    return counter
  end

  max_tree = forest[x][y]
  searcher = true

  while searcher && y > 0
     y -= 1
    counter += 1
    if forest[x][y] >= max_tree
      searcher = false
    end



  end



  return counter
end

def array_of_views(x,y,forest)
  scenic_score = 1
  return_array = []
  return_array << vis_top(x,y,forest)
  return_array << vis_left(x,y,forest)
  return_array << vis_right(x,y,forest)
  return_array << vis_bottom(x,y,forest)

  return_array.each do |ele|
    scenic_score *= ele
  end

  scenic_score
end

counter = 0

file_data.each_with_index do |ele_x,x_idx|
  ele_x.each_with_index do |ele_y, y_idx|
    tester = array_of_views(x_idx,y_idx,file_data)
    if tester >= counter
      counter = tester
    end
  end
end

p counter