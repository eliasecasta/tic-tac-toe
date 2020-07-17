#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

@zones = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
@current_player = 1
turns = 0
@numbers_selected = []

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

    @symbol_array = board.create_xy_arr(player1.symbol)

    print "Your turn, select a place to insert your symbol #{player1.name} => "
    player1_input = gets.chomp.to_i

    # player1_input = verify_input(player1_input, player1.name)

    while @numbers_selected.include?(player1_input) || (player1_input.to_i < 1) || (player1_input.to_i > 9)
      print "Another place please #{player1.name} =>"
      player1_input = gets.chomp.to_i
    end

    p player1_input

    change_value(player1_input, player1.name)
    @numbers_selected << player1_input.to_i
    @current_player = 2

  else

    @symbol_array = create_xy_arr(player2.symbol)

    print "Your turn, select a place to insert your symbol #{player2.symbol} => "
    player2_input = gets.chomp.to_i

    player2_input = verify_input(player2_input, player2.name)

    change_value(player2_input, player2.symbol)
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
