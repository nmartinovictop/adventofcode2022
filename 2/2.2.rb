file_data = File.read("prod.txt")

split_data = file_data.split("\n")

split_data.map! { |ele| ele.split(" ")}


# A = Rock
# B = Paper
# C = Scissors

# X = Rock
# Y = Paper
# Z = Scissors

# Rock = 1 point
# Paper = 2 points
# Scissors = 3 points

# 0 for loss
# 3 for draw
# 6 for win

def winner(computerChoice, humanChoice)
  if computerChoice == 'A'
    if humanChoice == 'X'
      winner = 'draw'
    elsif humanChoice == 'Y'
      winner = 'human'
    else
      winner = 'computer'
    end
  elsif computerChoice == 'B'
    if humanChoice == 'X'
      winner = 'computer'
    elsif humanChoice == 'Y'
      winner = 'draw'
    else
      winner = 'human'
    end
  else
    if humanChoice == 'X'
      winner = 'human'
    elsif humanChoice == 'Y'
      winner = 'computer'
    else
      winner = 'draw'
    end
  end

  return winner
end

# X = lose
# Y = draw
# z = win

# A = Rock
# B = Paper
# C = Scissors

# X = Rock
# Y = Paper
# Z = Scissors

def shapeNeeded(computerChoice,ending)
  if ending == 'X'
    if computerChoice == 'A'
      needed = 'Z'
    elsif   computerChoice == 'B'
      needed = 'X'
    else
      needed = 'Y'
    end
  elsif ending == 'Y'
    shapeMatcher = {'A'=> 'X','B' => 'Y','C'=>'Z'}
    needed = shapeMatcher[computerChoice]
    ##update above
  else
    if computerChoice == 'A'
      needed = 'Y'
    elsif   computerChoice == 'B'
      needed = 'Z'
    else
      needed = 'X'
    end
  end


  [computerChoice,needed]
end


def roundPoints(entry)
  points = 0

  choice = shapeNeeded(entry[0],entry[1])
  if choice[1] == 'X'
    points += 1
  elsif choice[1] == 'Y'
    points += 2
  else
    points += 3
  end

  if winner(choice[0],choice[1]) == 'human'
    points += 6
  elsif winner(choice[0],choice[1]) == 'draw'
    points += 3
  end

  return points


end

score = 0

split_data.each do |ele|
  score += roundPoints(ele)
end

p score

