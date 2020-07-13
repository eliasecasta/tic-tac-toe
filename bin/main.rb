#!/usr/bin/env ruby

@zones = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
first_player_symbol = 'X'
second_player_symbol = 'O' # Change this symbol to 'test' in order to check what will happen if there is a move that is a winning move
current_player = 1
turns = 0
@numbers_selected = []

def board
  puts ''
  @zones.each { |value| puts value.to_s.tr(',', ' ') }
  puts ''
end

def change_value(input, player_sym) # rubocop:disable Metrics/CyclomaticComplexity
  case input
  when 1
    @zones[0][0] = player_sym
  when 2
    @zones[0][1] = player_sym
  when 3
    @zones[0][2] = player_sym
  when 4
    @zones[1][0] = player_sym
  when 5
    @zones[1][1] = player_sym
  when 6
    @zones[1][2] = player_sym
  when 7
    @zones[2][0] = player_sym
  when 8
    @zones[2][1] = player_sym
  when 9
    @zones[2][2] = player_sym
  end
end

def decide_winner
  # This function will evaluate which player won and return 'win' when conditions are met.
  # When the move is not a winning move, the function returns false.
  # Proceeds to exit the loop when this function returns 'win'
  board
  if @zones.any? { |i| i.include? 'test' }
    p 'win'
    'win'
  else
    p 'continue'
    false
  end
end

def verify_input(player_input, current_player_name)
  # Verifies when the position input of the players is already taken and when it is valid (1-9). Proceeds to ask again
  # forr a valid input in the_case that the input is not valid.
  # This function will take as parameters player_input and current_player
  while @numbers_selected.include?(player_input) || (player_input.to_i < 1) || (player_input.to_i > 9)
    print "Another place please #{current_player_name} =>"
    player_input = gets.chomp.to_i
  end
  player_input
end

p 'What is the first player name?'
first_player_name = gets.chomp

p 'What is the second player name?'
second_player_name = gets.chomp

while turns < 9

  puts ''
  p 'This is the Tic-Tac-Toe board'

  board
  if current_player == 1

    print "Your turn, select a place to insert your symbol #{first_player_name} => "
    player1_input = gets.chomp.to_i

    player1_input = verify_input(player1_input, first_player_name)

    change_value(player1_input, first_player_symbol)
    @numbers_selected << player1_input.to_i
    current_player = 2

  else

    print "Your turn, select a place to insert your symbol #{second_player_name} => "
    player2_input = gets.chomp.to_i

    player2_input = verify_input(player2_input, second_player_name)

    change_value(player2_input, second_player_symbol)
    @numbers_selected << player2_input.to_i
    current_player = 1

  end

  turns += 1

  if decide_winner == 'win'
    # Prints who won
    board
    p 'Player X won'
    break
  end

  if turns == 9
    board
    p 'It was a draw'
  end
end
