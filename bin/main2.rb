#!/usr/bin/env ruby

require_relative 'player.rb'

p 'What is the first player name?'
player1 = Player.new('X', gets.chomp)

p 'What is the second player name?'
player2 = Player.new('O', gets.chomp)

p player1.name

p player2.name
