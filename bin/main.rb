#!/usr/bin/env ruby

@zones = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
first_player_symbol = 'X' # done
second_player_symbol = 'O' # done
@current_player = 1
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

def columns(position)
  test_arr = []
  @zones.each do |x|
    test_arr << x[position]
  end
  test_arr
end

def winning_rows(position)
  @zones[position]
end

def winning_diagonals_left(position)
  test_arr_diag_left = []
  @zones.each do |x|
    test_arr_diag_left << x[position]
    position += 1
  end
  test_arr_diag_left
end

def winning_diagonals_right(position)
  test_arr_diag_right = []
  @zones.each do |x|
    test_arr_diag_right << x[position]
    position -= 1
  end
  test_arr_diag_right
end

def create_xy_arr(player_sym)
  xy_arr = [player_sym, player_sym, player_sym]
  xy_arr
end

def decide_winner(symbol_array) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  xy_arr = symbol_array
  board

  if (columns(0) || columns(1) || columns(2)) == xy_arr
    'win'
  elsif (winning_rows(0) || winning_rows(1) || winning_rows(2)) == xy_arr
    'win'
  elsif winning_diagonals_left(0) == xy_arr
    'win'
  elsif winning_diagonals_right(2) == xy_arr
    'win'
  else false
  end
end

def verify_input(player_input, _current_player_name)
  # Verifies when the position input of the players is already taken and when it is valid (1-9). Proceeds to ask again
  # forr a valid input in the_case that the input is not valid.
  # This function will take as parameters player_input and @current_player
  while @numbers_selected.include?(player_input) || (player_input.to_i < 1) || (player_input.to_i > 9)
    print "Another place please #{@current_player_name} =>"
    player_input = gets.chomp.to_i
  end
  player_input
end

def who_is_playing
  @current_player == 2 ? @first_player_name : @second_player_name
end

def somebody_won(current_player)
  if decide_winner(@symbol_array) == 'win' && current_player
    board
    p "#{who_is_playing} won!!"
    true
  elsif decide_winner(@symbol_array) == 'win' && current_player
    board
    p "#{who_is_playing} won!!"
    true
  else false
  end
end

p 'What is the first player name?' # done
@first_player_name = gets.chomp # done

p 'What is the second player name?' # done
@second_player_name = gets.chomp # done

while turns < 9

  puts ''
  p 'This is the Tic-Tac-Toe board'

  board
  if @current_player == 1

    @symbol_array = create_xy_arr(first_player_symbol)

    print "Your turn, select a place to insert your symbol #{@first_player_name} => "
    player1_input = gets.chomp.to_i

    player1_input = verify_input(player1_input, @first_player_name)

    change_value(player1_input, first_player_symbol)
    @numbers_selected << player1_input.to_i
    @current_player = 2

  else

    @symbol_array = create_xy_arr(second_player_symbol)

    print "Your turn, select a place to insert your symbol #{@second_player_name} => "
    player2_input = gets.chomp.to_i

    player2_input = verify_input(player2_input, @second_player_name)

    change_value(player2_input, second_player_symbol)
    @numbers_selected << player2_input.to_i
    @current_player = 1

  end

  turns += 1

  break if somebody_won(@current_player) == true

  if turns == 9
    board
    p 'It was a draw'
  end
end
