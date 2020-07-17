require '../lib/checkers.rb'
class Board
  extend Checkers

  attr_reader :zones
  def initialize(zones)
    @zones = zones
  end
  columns(1)
  def print_board
    board_arr = []
    @zones.each do |value|
      board_arr << value.to_s.tr(',', ' ')
    end
    board_arr
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
end
