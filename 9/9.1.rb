file_data = File.read("test.txt").split("\n").map!{ |n| n.split(" ")}


# file_data = [["R", "4"], ["U", "4"], ["L", "3"], ["D", "1"], ["R", "4"], ["D", "1"], ["L", "5"], ["R", "2"]]


COORD_MAP = {'R'=>[0,1],"L"=>[0,-1],"D"=>[1,0],"U"=>[-1,0]}
H = [0,0]
T=[0,0]
TAIL_COORDS = []

def tail_ok(head_coords,tail_coords)

  if head_coords == tail_coords
    return true
  end

  if (head_coords[0].to_i - tail_coords[0].to_i).abs <= 1 && (head_coords[1].to_i - tail_coords[1].to_i).abs <= 1
    return true
  else
    return false
  end

end



def move_head(directions)
  direction = directions[0]
  num_times = directions[1].to_i


  num_times.times do 
    H[0],H[1] = H[0]+COORD_MAP[direction][0], H[1]+COORD_MAP[direction][1]

    if !tail_ok(H,T)
      T[0],T[1] = H[0]-COORD_MAP[direction][0], H[1]-COORD_MAP[direction][1]
      p T
    end

    TAIL_COORDS << T
    
  end

end


move_head(['R',"4"])
