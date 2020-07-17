#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

@zones = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
@current_player = 1
turns = 0

p 'What is the first player name?'
player1 = Player.new('X', "Elias")

p 'What is the second player name?'
player2 = Player.new('O', "Miguel")

puts ''
p 'This is the Tic-Tac-Toe board'

board = Board.new(@zones)

puts board.print_board

while turns < 9

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
  else
    board
  end
end
