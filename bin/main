#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

@zones = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
@current_player = 1
turns = 0
@numbers_selected = []

p 'What is the first player name?'
p1_name = gets.chomp
p "What symbol do you want #{p1_name}?"
p1_symbol = gets.chomp
player1 = Player.new(p1_name, p1_symbol)

p 'What is the second player name?'
p2_name = gets.chomp
p "What symbol do you want #{p2_name}?"
p2_symbol = gets.chomp
player2 = Player.new(p2_name, p2_symbol)

puts ''
p 'This is the Tic-Tac-Toe board'
puts ''

board1 = Board.new(@zones, @current_player, @numbers_selected)
puts board1.print_board
puts ''

while turns < 9

  if @current_player == 1

    @symbol_array = board1.create_xy_arr(player1.symbol)

    print "Your turn, select a place to insert your symbol #{player1.name} => "
    player1_input = gets.chomp.to_i
    puts ''

    while @numbers_selected.include?(player1_input) || (player1_input.to_i < 1) || (player1_input.to_i > 9)
      print "Another place please #{player1.name} =>"
      player1_input = gets.chomp.to_i
    end

    board1.change_value(player1_input, player1.symbol)
    @numbers_selected << player1_input.to_i
    @current_player = 2

  else

    @symbol_array = board1.create_xy_arr(player2.symbol)

    print "Your turn, select a place to insert your symbol #{player2.name} => "
    player2_input = gets.chomp.to_i
    puts ''

    while @numbers_selected.include?(player2_input) || (player2_input.to_i < 1) || (player2_input.to_i > 9)
      print "Another place please #{player2.name} =>"
      player2_input = gets.chomp.to_i
    end

    board1.change_value(player2_input, player2.symbol)
    @numbers_selected << player2_input.to_i
    @current_player = 1

  end

  turns += 1

  if board1.decide_winner(@symbol_array) == 'win' && @current_player == 2
    puts board1.print_board
    puts ''
    print "#{player1.name} won!"
    puts ''
    break
  elsif board1.decide_winner(@symbol_array) == 'win' && @current_player == 1
    puts board1.print_board
    print "#{player2.name} won!"
    puts ''
    break
  end

  if turns == 9
    puts board1.print_board
    puts ''
    p 'It was a draw'
    puts ''

  end
  puts board1.print_board
  puts ''
end
