#!/usr/bin/env ruby

@zones = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # done
first_player_symbol = 'X' # done
second_player_symbol = 'O' # done
@current_player = 1 # done
turns = 0 # done
@numbers_selected = [] # done

def board # done
  puts '' # done
  @zones.each { |value| puts value.to_s.tr(',', ' ') } # done
  puts '' # done
end # done

def change_value(input, player_sym) # rubocop:disable Metrics/CyclomaticComplexity # done
  case input # done
  when 1 # done
    @zones[0][0] = player_sym # done
  when 2 # done
    @zones[0][1] = player_sym # done
  when 3 # done 
    @zones[0][2] = player_sym # done
  when 4 # done
    @zones[1][0] = player_sym # done
  when 5 # done
    @zones[1][1] = player_sym # done
  when 6 # done
    @zones[1][2] = player_sym # done
  when 7 # done
    @zones[2][0] = player_sym # done
  when 8 # done
    @zones[2][1] = player_sym # done
  when 9 # done
    @zones[2][2] = player_sym # done
  end # done
end # done

def columns(position) # done
  test_arr = [] # done
  @zones.each do |x| # done
    test_arr << x[position] # done
  end # done
  test_arr # done
end # done

def winning_rows(position) # done
  @zones[position] # done
end # done

def winning_diagonals_left(position) # done
  test_arr_diag_left = [] # done
  @zones.each do |x| # done
    test_arr_diag_left << x[position] # done
    position += 1 # done
  end # done
  test_arr_diag_left # done
end # done

def winning_diagonals_right(position) # done
  test_arr_diag_right = [] # done
  @zones.each do |x| # done
    test_arr_diag_right << x[position] # done
    position -= 1 # done
  end # done
  test_arr_diag_right # done
end # done

def create_xy_arr(player_sym) # done
  xy_arr = [player_sym, player_sym, player_sym] # done
  xy_arr # done
end # done

def decide_winner(symbol_array) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity  # done
  xy_arr = symbol_array # done

  if columns(0) == xy_arr || columns(1) == xy_arr || columns(2) == xy_arr # rubocop:disable Style/MultipleComparison # done
    'win' # done
  elsif winning_rows(0) == xy_arr || winning_rows(1) == xy_arr || winning_rows(2) == xy_arr # rubocop:disable Style/MultipleComparison # done
    'win' # done
  elsif winning_diagonals_left(0) == xy_arr || winning_diagonals_right(2) == xy_arr # rubocop:disable Style/MultipleComparison # done
    'win' # done
  else false # done
  end # done
end # done

def verify_input(player_input, _current_player_name) # done
  # Verifies when the position input of the players is already taken and when it is valid (1-9). Proceeds to ask again
  # forr a valid input in the_case that the input is not valid.
  # This function will take as parameters player_input and @current_player
  while @numbers_selected.include?(player_input) || (player_input.to_i < 1) || (player_input.to_i > 9) # done
    print "Another place please #{@current_player_name} =>" # done
    player_input = gets.chomp.to_i # done
  end # done
  player_input # done
end # done

def who_is_playing # done
  @current_player == 2 ? @first_player_name : @second_player_name # done
end # done

def somebody_won(current_player) # done
  if decide_winner(@symbol_array) == 'win' && current_player # done
    board # done
    p "#{who_is_playing} won!!" # done
    true # done
  elsif decide_winner(@symbol_array) == 'win' && current_player # done
    board # done
    p "#{who_is_playing} won!!" # done
    true # done
  else false # done
  end # done
end # done

p 'What is the first player name?' # done
@first_player_name = gets.chomp # done

p 'What is the second player name?' # done
@second_player_name = gets.chomp # done

puts '' # done
p 'This is the Tic-Tac-Toe board' # done
board # done

while turns < 9 # done

  if @current_player == 1 # done

    @symbol_array = create_xy_arr(first_player_symbol) # done

    print "Your turn, select a place to insert your symbol #{@first_player_name} => " # done
    player1_input = gets.chomp.to_i # done

    player1_input = verify_input(player1_input, @first_player_name) # done

    change_value(player1_input, first_player_symbol) # done
    @numbers_selected << player1_input.to_i # done
    @current_player = 2 # done

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
  else
    board
  end
end
