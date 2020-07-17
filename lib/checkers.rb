module Checkers
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

    if columns(0) == xy_arr || columns(1) == xy_arr || columns(2) == xy_arr # rubocop:disable Style/MultipleComparison
      'win'
    elsif winning_rows(0) == xy_arr || winning_rows(1) == xy_arr || winning_rows(2) == xy_arr # rubocop:disable Style/MultipleComparison
      'win'
    elsif winning_diagonals_left(0) == xy_arr || winning_diagonals_right(2) == xy_arr # rubocop:disable Style/MultipleComparison
      'win'
    else false
    end
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
end
