KNIGHT_MOVES = [
  [2, 1], [2, -1], [-2, 1], [-2, -1],
  [1, 2], [1, -2], [-1, 2], [-1, -2]
]

def is_within_board(x, y)
  x.between?(0, 7) && y.between?(0, 7)
end

def knight_moves(starting_position, finish_position)
  return print_result([starting_position]) if starting_position == finish_position

  queue = [[starting_position, [starting_position]]]
  visited = Set.new([starting_position])

  until queue.empty?
    current_position, path = queue.shift

    KNIGHT_MOVES.each do |move|
      new_x = current_position[0] + move[0]
      new_y = current_position[1] + move[1]
      new_position = [new_x, new_y]

      if is_within_board(new_x, new_y) && !visited.include?(new_position)
        new_path = path + [new_position]
        
        if new_position == finish_position
          return print_result(new_path)
        end
        
        queue.push([new_position, new_path])
        visited.add(new_position)
      end
    end
  end

  []
end

def print_result(array)
  puts "You made it in #{array.length-1} moves!  Here's your path:"
  array.each {|position| p position}
end

















# #Finds the quickest route from starting position to finish
# #position.
# #Takes two arrays as arguments:
# #starting_position: an array of 2 integers, both being between 0-7. First one is the x axis, second the y axis
# #finish_position: an array of 2 integers, both being between 0-7. First one is the x axis, second the y axis
# def knight_moves(starting_position, finish_position)

#   all_possible_endings << knight_moves_breath_search_recursive(starting_position, finish_position, [])

#   all_possible_endings.sort.shift
# end

# def knight_moves_breath_search_recursive(current_position, finish_position, array_of_moves_made)
#   array_of_moves_made.push(current_position)

#   available_knight_moves(current_position).each do |move|
#     return array_of_moves_made.push(move) if move == finish_position
#     knight_moves_breath_search_recursive(move, finish_position, array_of_moves_made.map(&:clone))
#   end
# end

# #Returns an array of available moves from
# #the specified position.
# #starting_position: an array of 2 integers, both being between 0-7. First one is the x axis, second the y axis
# def available_knight_moves(starting_position)
#   array_of_moves = []

#   #up, right, down, left
#   if starting_position[0] + 2 <= 7 && starting_position[1] - 1 >= 0 #going right, dowh
#     array_of_moves << [(starting_position[0] + 2), (starting_position[1] - 1)]
#   end
#   if starting_position[0] + 2 <= 7 && starting_position[1] + 1 <= 7 #going right, up
#     array_of_moves << [(starting_position[0] + 2), (starting_position[1] + 1)]
#   end


#   if starting_position[0] - 2 >= 0 && starting_position[1] - 1 >= 0 #going left, down
#     array_of_moves << [(starting_position[0] - 2), (starting_position[1] - 1)]
#   end
#   if starting_position[0] - 2 >= 0 && starting_position[1] + 1 <= 7 #going left, up
#     array_of_moves << [(starting_position[0] - 2), (starting_position[1] + 1)]
#   end


#   if starting_position[0] + 1 <= 7 && starting_position[1] + 2 <=7 #going up, right
#     array_of_moves << [(starting_position[0] + 1), (starting_position[1] + 2)]
#   end
#   if starting_position[0] - 1 >= 0 && starting_position[1] + 2 <=7 #going up, left
#     array_of_moves << [(starting_position[0] - 1), (starting_position[1] + 2)]
#   end


#   if starting_position[0] + 1 <= 7 && starting_position[1] - 2 >=0 #going down, right
#     array_of_moves << [(starting_position[0] + 1), (starting_position[1] - 2)]
#   end
#   if starting_position[0] - 1 >= 0 && starting_position[1] - 2 >=0 #going down, left
#     array_of_moves << [(starting_position[0] - 1), (starting_position[1] - 2)]
#   end

#   array_of_moves
# end
